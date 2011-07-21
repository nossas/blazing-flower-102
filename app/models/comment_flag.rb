class CommentFlag < ActiveRecord::Base
  belongs_to :member
  belongs_to :comment

  validates_presence_of :member_id
  validates_presence_of :comment_id
  validates_uniqueness_of :member_id, :scope => :comment_id
end
