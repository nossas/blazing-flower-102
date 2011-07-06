class ProviderAuthorization < ActiveRecord::Base
  validates_presence_of :member_id
  validates_presence_of :provider
  validates_presence_of :uid
  validates_uniqueness_of :provider, :scope => :member_id
  validates_uniqueness_of :uid, :scope => :provider

  belongs_to :member
end
