class Petition < ActiveRecord::Base
  has_one :autofire_email

  validates_presence_of :title
  validates_presence_of :custom_path
  validates_uniqueness_of :custom_path
  validates_presence_of :call_to_action
  validates_presence_of :state
end
