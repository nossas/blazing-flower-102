class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :active, :email, :first_name, :last_name, :admin, :password, :password_confirmation, :remember_me, :avatar

  validates_presence_of :email, :first_name, :last_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_create {|u| false if u.password.blank?}

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }

  def update_with_password(params={}) 
    logger.debug "*****************#{params.inspect}*************}"
    if params[:password].blank? 
      logger.debug "$$$$$$$$$$$$$$$$$#{params[:password]}$$$$$$$$$$$$"
      params.delete(:password) 
      params.delete(:password_confirmation) if 
      params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end 

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && account_active?
  end

  def account_active?
    self.active
  end

end
