class Comment < ActiveRecord::Base
  MODERATION_THRESHOLD = 3

  belongs_to :commentable, :polymorphic => true
  belongs_to :member

  has_many :flags, :class_name => 'CommentFlag'

  validates_presence_of :content
  validates_presence_of :member_id
  validates_presence_of :commentable_id
  validates_presence_of :commentable_type

  def self.waiting_moderation
    where(["(SELECT count(*) FROM comment_flags WHERE comment_flags.comment_id = comments.id) >= ?", MODERATION_THRESHOLD])
  end
end
