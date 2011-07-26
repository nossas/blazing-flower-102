class Member < ActiveRecord::Base
  has_many :petition_signatures
  has_many :members
  has_many :provider_authorizations
  has_many :comments

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_presence_of :first_name
  validates_presence_of :last_name

  devise :omniauthable

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if member = find_by_email(data["email"])
      member.update_attributes(:image_url => access_token["user_info"]["image"]) if member.image_url.nil?
      member
    else
      self.create(
        :email => data["email"], 
        :first_name => data["first_name"], 
        :last_name => data["last_name"],
        :image_url => access_token["user_info"]["image"])
    end
  end

  def self.find_for_google_apps_oauth(access_token, signed_in_resource=nil)
    return false unless access_token["user_info"]["email"]
    if member = find_by_email(access_token["user_info"]["email"])
      member.update_attributes(:image_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(access_token['user_info']['email'])}.jpg?s=60&d=identicon") if member.image_url.nil?
      member
    else
      # the || tackles the google custom domain issue
      self.create(
        :email => access_token["user_info"]["email"], 
        :first_name => access_token["first_name"] || access_token["user_info"]["first_name"], 
        :last_name => access_token["last_name"] || access_token["user_info"]["last_name"],
        :image_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(access_token['user_info']['email'])}.jpg?s=60&d=identicon")
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
