class Job < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :active
end
