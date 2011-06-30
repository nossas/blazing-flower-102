class Petition < ActiveRecord::Base
  has_one :autofire_email
  has_one :taf
  has_many :petition_signatures

  validates_presence_of :title
  validates_presence_of :custom_path
  validates_uniqueness_of :custom_path
  validates_presence_of :call_to_action
  validates_presence_of :call_to_action_headline
  validates_presence_of :call_to_action_text
  validates_presence_of :media

  validates_format_of :custom_path, :with => /^[a-zA-Z0-9_-]+$/

  validates_inclusion_of :display_counter, :in => [true,false]
  validates_presence_of :counter_threshold

  validates_inclusion_of :display_comment_field, :in => [true,false]
  validates_inclusion_of :surface_comments, :in => [true,false]
  validates_presence_of :comment_question, :if => Proc.new { |t| t.display_comment_field }

  validate :has_valid_state_attributes

  def complete?
    (self.taf && self.autofire_email && self.taf.valid? && self.autofire_email.valid?)
  end

  state_machine :state, :initial => :draft do

    #Events
    event :publish do
      transition [:draft, :archived, :deactivated] => :published, :if => :complete?
    end

    event :archive do
      transition [:published, :deactivated] => :archived, :if => :complete?
    end

    event :deactivate do
      transition [:published, :archived] => :deactivated, :if => :complete?
    end

    # States
    state :draft do
      def has_valid_state_attributes
        true
      end
    end

    state :published do
      def has_valid_state_attributes
        errors.add(:state, "Cannot transition to published state") unless self.complete?
      end
    end

    state :archived do
      def has_valid_state_attributes
        errors.add(:state, "Cannot transition to archived state") unless self.complete?
      end
    end

    state :deactivated do
      def has_valid_state_attributes
        errors.add(:state, "Cannot transition to archived state") unless self.complete?
      end
    end
  end

end
