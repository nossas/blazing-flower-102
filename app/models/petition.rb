require 'aws/s3'
require 'csv'

class Petition < ActiveRecord::Base
  has_one :autofire_email, :dependent => :destroy
  has_one :taf, :dependent => :destroy
  has_many :petition_signatures

  has_many :members, :through => :petition_signatures

  belongs_to :issue

  validates_presence_of :issue

  validates_presence_of :title
  validates_presence_of :headline
  validates_presence_of :custom_path
  validates_uniqueness_of :custom_path
  validates_presence_of :call_to_action
  validates_presence_of :call_to_action_headline
  validates_presence_of :call_to_action_text
  validates_presence_of :media
  validates_presence_of :description
  validates_presence_of :short_description

  validates_length_of :call_to_action, :maximum => 20

  validates_format_of :custom_path, :with => /^[a-zA-Z0-9_-]+$/

  validates_inclusion_of :display_counter, :in => [true,false]
  validates_numericality_of :counter_threshold, :counter_goal, :additional_signatures, :only_integer => true

  validates_inclusion_of :display_comment_field, :in => [true,false]
  validates_inclusion_of :surface_comments, :in => [true,false]
  validates_presence_of :comment_question, :if => Proc.new { |t| t.display_comment_field }
  
  validate :has_valid_state_attributes

  before_create :add_wmode_to_youtube_iframe

  def complete?
    (taf && autofire_email && taf.valid? && autofire_email.valid?) || (autofire_email && autofire_email.valid? && display_donation)
  end

  def ok_to_display_counter?
    self.display_counter && (self.petition_signatures.count + self.additional_signatures >= self.counter_threshold)
  end

  def percentage_complete
    percent = 0
    count = signature_count
    
    if counter_goal != 0
      if count < counter_goal
        percent = (count * 100) / counter_goal
      elsif count >= counter_goal
        percent = 100
      end
    else
      percent = 0
    end

    return percent
  end
  
  def signature_count
    petition_signatures.count + additional_signatures
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

  def export_to_csv
    Rails.logger.info "Exporting #{self.title} to CSV."

    headings = [
      "id",
      "first_name",
      "last_name",
      "email",
      "zona",
      "celular",
      "created_at"
    ]

    file = Rails.root.to_s + "/tmp/signatures-#{self.title}.csv"
    CSV.open(file, 'wb') do |f|
      f << headings
      self.members.each do |member|
        f << headings.collect{|item| member.send(item)}
      end
    end

    Rails.logger.info "Sending #{self.title} to S3."

    s3_file_name = "#{Time.now.strftime("%m-%d-%H-%M")}-signatures-#{self.title}.csv"
    AWS::S3::S3Object.store(s3_file_name, open(file), SITE['s3_export_bucket'], :content_type => 'text/csv')

    Rails.logger.info "Finished preparing and uploading lists to S3. End of Line."
  end

  def add_wmode_to_youtube_iframe
    self.media.gsub!(/(<iframe .*src=)("([^"\?]*)")/, '\1"\3?wmode=opaque"')
  end
end
