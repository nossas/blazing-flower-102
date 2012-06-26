require 'spec_helper'

describe Issue do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image_file_name }
  it { should validate_presence_of :thumbnail_file_name }
  it { should_not allow_value('This is way toooooooooo looooooooooooooooong it has so many characters try counting them all I bet you can not do it. It is longer than a tweet. Or maybe it is not I have not actually counted.').for(:debate_call_to_action) }
  it { should_not allow_value('This is way toooooooooo looooooooooooooooong it has so many characters try counting them all I bet you can not do it. It is longer than a tweet. Or maybe it is not I have not actually counted.').for(:petition_call_to_action) }
  it { should_not allow_value('This is way toooooooooo looooooooooooooooong it has so many characters try counting them all I bet you can not do it. It is longer than a tweet. Or maybe it is not I have not actually counted.').for(:personal_story_call_to_action) }
  it { should allow_value('This is not too long. It is practically perfect in every way.').for(:debate_call_to_action) }
  it { should allow_value('This is not too long. It is practically perfect in every way.').for(:petition_call_to_action) }
  it { should allow_value('This is not too long. It is practically perfect in every way.').for(:personal_story_call_to_action) }
  it { should have_many :idea_categories }
  it { should have_many :idea_help_methods }
  it { should have_many :ideas }
  it { should have_many :petitions }
  it { should have_many :petition_signatures }
  it { should belong_to :featured_petition }
  it { should have_many :personal_stories }
  it { should belong_to :featured_personal_story }
  it { should have_many :debates }
  it { should belong_to :featured_debate }
end
