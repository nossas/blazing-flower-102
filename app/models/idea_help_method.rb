class IdeaHelpMethod < ActiveRecord::Base

  belongs_to :issue
  has_many :ideas
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :issue_id

end
