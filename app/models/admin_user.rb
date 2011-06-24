class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "60x60" }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :avatar, :email, :password, :password_confirmation, :remember_me
end
