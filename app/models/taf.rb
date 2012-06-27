class Taf < ActiveRecord::Base
  belongs_to :petition

  validates_presence_of :petition
  validates_presence_of :thank_you_headline
  validates_presence_of :thank_you_text

  validates_inclusion_of :display_orkut, :in => [true,false]
  validates_presence_of :orkut_title,   :if => Proc.new { |t| t.display_orkut }
  validates_presence_of :orkut_link,    :if => Proc.new { |t| t.display_orkut }
  validates_presence_of :orkut_message, :if => Proc.new { |t| t.display_orkut }

  validates_inclusion_of :display_facebook, :in => [true,false]
  validates_presence_of :facebook_title,   :if => Proc.new { |t| t.display_facebook }
  validates_presence_of :facebook_link,    :if => Proc.new { |t| t.display_facebook }
  validates_presence_of :facebook_message, :if => Proc.new { |t| t.display_facebook }

  validates_inclusion_of :display_twitter, :in => [true,false]
  validates_presence_of :tweet,       :if => Proc.new { |t| t.display_twitter }
  validates_presence_of :twitter_url, :if => Proc.new { |t| t.display_twitter}

  validates_inclusion_of :display_email, :in => [true,false]
  validates_presence_of :email_subject, :if => Proc.new { |t| t.display_email }
  validates_presence_of :email_message, :if => Proc.new { |t| t.display_email }

  validates_inclusion_of :display_copy_url, :in => [true,false]

  mount_uploader :facebook_image,             AvatarUploader, :mount_on => :facebook_image_file_name
  mount_uploader :alternate_facebook_image,   AvatarUploader, :mount_on => :alternate_facebook_image_file_name
  mount_uploader :alternate_facebook_image_2, AvatarUploader, :mount_on => :alternate_facebook_image_2_file_name
  mount_uploader :alternate_facebook_image_3, AvatarUploader, :mount_on => :alternate_facebook_image_3_file_name
  mount_uploader :alternate_facebook_image_4, AvatarUploader, :mount_on => :alternate_facebook_image_4_file_name
 
  def ok_to_display_copy_url?
    self.display_copy_url
  end
  
  def ok_to_display_facebook?
    self.display_facebook
  end

  def ok_to_display_twitter?
    self.display_twitter
  end
  
  def ok_to_display_orkut?
    self.display_orkut
  end
  
  def ok_to_display_email?
    self.display_email
  end

end
