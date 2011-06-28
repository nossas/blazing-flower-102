class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,  :first_name, :last_name, :confirmed_at, :password, :password_confirmation, :remember_me, :is_admin, :is_campaigner, :active

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "60x60" }

  validates_presence_of :email, :first_name, :last_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  # before_create {|u| false if u.password.blank?}

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
