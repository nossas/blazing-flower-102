class Member < ActiveRecord::Base
  has_many :petition_signatures

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :zona

  devise :omniauthable

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if member = find_by_email(data["email"])
      member
    else # Create a user with a stub password. 
      m = new(:email => data["email"], :name => data["name"]) 
      m.save(:validate => false)
    end
  end
end
