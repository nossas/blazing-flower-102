class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :admin, :password, :password_confirmation, :remember_me

  validates_presence_of :email, :first_name, :last_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_create {|u| false if u.password.blank?}

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
  
end
