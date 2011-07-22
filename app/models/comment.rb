class Comment < ActiveRecord::Base
  MODERATION_THRESHOLD = 3

  belongs_to :commentable, :polymorphic => true
  belongs_to :member

  has_many :flags, :class_name => 'CommentFlag'

  validates_presence_of :content
  validates_presence_of :member_id
  validates_presence_of :commentable_id
  validates_presence_of :commentable_type
  validate :validate_member_has_profile

  def self.waiting_moderation
    where(["(SELECT count(*) FROM comment_flags WHERE comment_flags.comment_id = comments.id) >= ?", MODERATION_THRESHOLD])
  end

  def validate_member_has_profile
    errors.add(:member, "Member should have a profile to comment.") if member and member.provider_authorizations.empty?
  end
end
