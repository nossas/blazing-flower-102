class Member < ActiveRecord::Base
  has_many :petition_signatures

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :zona

end
