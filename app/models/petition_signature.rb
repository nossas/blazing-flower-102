class PetitionSignature < ActiveRecord::Base
  belongs_to :petition
  belongs_to :member

  after_create :send_confirmation
  validate :belongs_to_published_petition
  validates_uniqueness_of :member_id, :scope => :petition_id

  scope :by_updated_at, proc {|updated_at| where("updated_at >= ?", updated_at)}

  def self.unmoderated
    where('comment_accepted IS NULL')
  end

  def self.moderated
    where('comment_accepted IS NOT NULL')
  end

  def send_confirmation
    PetitionMailer.delay.petition_signature_confirmation(self)
  end

  def belongs_to_published_petition
    errors.add(:petition, "Petition must be published in order to be signed") unless petition.published?
  end

  def reject_comment
    self.update_attribute :comment_accepted, false
    self
  end

  def accept_comment
    self.update_attribute :comment_accepted, true
    self
  end
end
