class PersonalStory < ActiveRecord::Base
  belongs_to :issue

  validates_presence_of :issue
  validates_presence_of :title
  validates_presence_of :video_embed_code

  validates_inclusion_of :connected_action, :in => ['PETITION', 'DEBATE'], :allow_nil => true
end
