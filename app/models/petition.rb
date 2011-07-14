require 'aws/s3'
require 'csv'

class Petition < ActiveRecord::Base
  has_one :autofire_email
  has_one :taf
  has_many :petition_signatures

  has_many :members, :through => :petition_signatures

  belongs_to :issue

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
  validates_presence_of :counter_goal, :if => Proc.new { |t| t.display_counter }

  validates_inclusion_of :display_comment_field, :in => [true,false]
  validates_inclusion_of :surface_comments, :in => [true,false]
  validates_presence_of :comment_question, :if => Proc.new { |t| t.display_comment_field }

  validate :has_valid_state_attributes

  def complete?
    (self.taf && self.autofire_email && self.taf.valid? && self.autofire_email.valid?)
  end

  def ok_to_display_counter?
    self.display_counter && (self.petition_signatures.count >= self.counter_threshold)
  end
  
  def percentage_complete
    percent = 0

    if ((self.counter_goal != 0) && (self.petition_signatures.count < self.counter_goal))
      percent = (self.petition_signatures.count * 100) / self.counter_goal
    elsif (self.counter_goal != 0) && (self.petition_signatures.count >= self.counter_goal)
      percent = 100
    else
      percent = 0
    end

    return percent
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
    AWS::S3::Base.establish_connection!(
      :access_key_id     => SITE['s3_access_key_id'],
      :secret_access_key => SITE['s3_secret_access_key']
    )

    headings = [
      "id",
      "first_name",
      "last_name",
      "email",
      "zona",
      "celular",
      "created_at"
    ]

    Rails.logger.info "Exporting #{self.title} to CSV."
    lines = []
    headings_plus = headings.clone
    headings_plus.push("petition")
    lines << CSV.generate_line(headings_plus) 

    self.members.each do |member|
      data = headings.collect{|item| member.send(item)}
      data.push(self.title)
      lines << CSV.generate_line(data)
    end

    file = Rails.root.to_s + "/tmp/signatures-#{self.title}.csv"
    CSV.open(file, 'wb') do |f|
      f << lines
    end

    s3_file_name = "#{Time.now.strftime("%m-%d-%H-%M")}-signatures-#{self.title}.csv"
    AWS::S3::S3Object.store(s3_file_name, open(file), SITE['s3_export_bucket'], :content_type => 'text/csv')
    Rails.logger.info "Finished preparing and uploading lists to S3. End of Line."
  end


end
