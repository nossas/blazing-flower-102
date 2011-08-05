class Issue < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :debate_call_to_action, :in => 60..80, :allow_blank => true
  validates_length_of :petition_call_to_action, :in => 60..80, :allow_blank => true
  validates_length_of :personal_story_call_to_action, :in => 60..80, :allow_blank => true

  has_many :petitions
  has_many :debates
  has_many :personal_stories

  belongs_to :featured_petition, :class_name => 'Petition', :foreign_key => :featured_petition_id
  belongs_to :featured_debate, :class_name => 'Debate', :foreign_key => :featured_debate_id
  belongs_to :featured_personal_story, :class_name => 'PersonalStory', :foreign_key => :featured_personal_story_id

  has_attached_file :image,
                    :path => ':attachment/:id/:style/:filename',
                    :storage => :s3,
                    :styles => { :large => "630x435" },
                    :bucket => SITE['s3_bucket'],
                    :s3_credentials => {
                      :access_key_id => SITE['s3_access_key_id'],
                      :secret_access_key => SITE['s3_secret_access_key']
                    }
end
