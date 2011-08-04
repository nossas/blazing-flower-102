class Job < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_inclusion_of :active, :in => [true,false]

  scope :active, where(:active => true)
end
