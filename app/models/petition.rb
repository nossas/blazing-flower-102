class Petition < ActiveRecord::Base
  has_one :autofire_email
  has_one :taf

  validates_presence_of :title
  validates_presence_of :custom_path
  validates_uniqueness_of :custom_path
  validates_presence_of :call_to_action
  validates_presence_of :call_to_action_headline
  validates_presence_of :call_to_action_text
  validates_presence_of :media
  validates_presence_of :state

  validates_format_of :custom_path, :with => /^[a-zA-Z0-9_-]+$/

  validates_inclusion_of :display_counter, :in => [true,false]
  validates_presence_of :counter_threshold

  validates_inclusion_of :display_comment_field, :in => [true,false]
  validates_inclusion_of :surface_comments, :in => [true,false]
  validates_presence_of :comment_question, :if => Proc.new { |t| t.display_comment_field }

end
