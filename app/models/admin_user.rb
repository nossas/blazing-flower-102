class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,  :first_name, :last_name, :avatar, 
                  :password, :password_confirmation, :remember_me, 
                  :is_admin, :is_campaigner, :active

  validates_presence_of :email, :first_name, :last_name
  validates_format_of :email, :with => EMAIL_REGEX

  mount_uploader :avatar, AvatarUploader, :mount_on => :avatar_file_name

  before_create {|u| false if u.password.blank?}

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && account_active?
  end

 def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params) 
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def account_active?
    self.active
  end

end
