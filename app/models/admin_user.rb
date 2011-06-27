class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "60x60" }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :avatar, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :email, :first_name, :last_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_create {|u| false if u.password.blank?}

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && account_active?
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  private
    def account_active?
      self.active
    end
  
end
