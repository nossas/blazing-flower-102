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

  def self.awaiting_moderation
    self.where(["comment_accepted IS NULL AND (SELECT count(*) FROM comment_flags WHERE comment_flags.comment_id = comments.id) >= ?", MODERATION_THRESHOLD])
  end

  def self.moderated
    where("comment_accepted IS NOT NULL")
  end

  def validate_member_has_profile
    errors.add(:member, "Member should have a profile to comment.") if member and member.provider_authorizations.empty?
  end

  def accept
    update_attribute :comment_accepted, true
  end

  def reject
    update_attribute :comment_accepted, false
  end
end
