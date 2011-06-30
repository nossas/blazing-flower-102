class Member < ActiveRecord::Base
  has_many :petition_signatures

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :zona

  devise :omniauthable

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end


end
