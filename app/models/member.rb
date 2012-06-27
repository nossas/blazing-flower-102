class Member < ActiveRecord::Base
  has_many :petition_signatures
  has_many :members
  has_many :provider_authorizations, :dependent => :destroy
  has_many :comments
  has_many :ideas

  has_many :debates_side_1, :class_name => 'Debate', :foreign_key => :author_email_side_1, :primary_key => :email
  has_many :debates_side_2, :class_name => 'Debate', :foreign_key => :author_email_side_2, :primary_key => :email

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_confirmation_of :password
  validates :encrypted_password, :presence => true, :if => "has_non_oauth_login"
  validates :password_confirmation, :presence => true, :if => "password"
  
  mount_uploader :image, AvatarUploader, :mount_on => :image_file_name

  devise :database_authenticatable, :registerable, :omniauthable, :recoverable, :confirmable

  scope :by_updated_at, proc {|updated_at| where("updated_at >= ?", updated_at)}

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    email = access_token['user_info']['email']
    if member = find_by_email(email)
      member.update_attributes(:image_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}.jpg?s=260&d=http://#{SITE['site_url']}/assets/avatar_blank.png") if member.image_url.nil?
      member
    else
      gravatar = (email ? "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}.jpg?s=260&d=http://#{SITE['site_url']}/assets/avatar_blank.png" : nil)
      begin
        self.create!(
          :email => email, 
          :first_name => data["first_name"], 
          :last_name => data["last_name"],
          :image_url => gravatar,
          :confirmed_at => Time.now,
          :has_non_oauth_login => false,
          :has_login => true )
      rescue => e
        raise "#{e.inspect}\nUser hash: #{access_token.inspect}"
      end
    end
  end

  def self.find_for_google_oauth(access_token, signed_in_resource=nil)
    return false unless access_token["user_info"]["email"]
    if member = find_by_email(access_token["user_info"]["email"])
      member.update_attributes(:image_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(access_token['user_info']['email'])}.jpg?s=260&d=http://#{SITE['site_url']}/assets/avatar_blank.png") if member.image_url.nil?
      member
    else
      # the || tackles the google custom domain issue
      self.create(
        :email => access_token["user_info"]["email"], 
        :first_name => access_token["first_name"] || access_token["user_info"]["first_name"], 
        :last_name => access_token["last_name"] || access_token["user_info"]["last_name"],
        :image_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(access_token['user_info']['email'])}.jpg?s=260&d=http://#{SITE['site_url']}/assets/avatar_blank.png",
        :confirmed_at => Time.now,
        :has_non_oauth_login => false,
        :has_login => true )
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def action_history
    history = (self.ideas + self.petition_signatures + self.comments + self.debates_side_1 + self.debates_side_2).sort{|x, y| y.created_at <=> x.created_at}
    if history && self.confirmed_at
      history.find_all{|i| i.created_at > self.confirmed_at}
    else
      []
    end
  end

  def current_image_url(size="medium")
    if self.image.url == "/images/original/missing.png"
      self.image_url
    else
      self.image.url(size)
    end
  end

  def has_signed? petition_id
    !!petition_signatures.find_by_petition_id(petition_id)
  end

  def password_if_MR_login

  end

  def facebook_authorization
    self.provider_authorizations.find_by_provider("facebook")
  end

  def friends
    if facebook_authorization
      graph = Koala::Facebook::GraphAPI.new(facebook_authorization.token)
      graph.get_connections("me", "friends").sort{|x, y| x["name"] <=> y["name"]}
    else
      []
    end
  end
end
