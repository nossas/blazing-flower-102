require 'spec_helper'

describe Issue do
  it { should validate_presence_of :name } 
  it { should validate_presence_of :image_file_name }
  it { should validate_presence_of :thumbnail_file_name }
  it { should_not allow_value('This is way toooooooooo looooooooooooooooong it has so many characters try counting them all I bet you can not do it. It is longer than a tweet. Or maybe it is not I have not actually counted.').for(:debate_call_to_action) }
  it { should_not allow_value('This is way toooooooooo looooooooooooooooong it has so many characters try counting them all I bet you can not do it. It is longer than a tweet. Or maybe it is not I have not actually counted.').for(:petition_call_to_action) }
  it { should_not allow_value('This is way toooooooooo looooooooooooooooong it has so many characters try counting them all I bet you can not do it. It is longer than a tweet. Or maybe it is not I have not actually counted.').for(:personal_story_call_to_action) }
  it { should allow_value('This is not too long. It is practically perfect in every way.').for(:debate_call_to_action) }
  it { should allow_value('This is not too long. It is practically perfect in every way.').for(:petition_call_to_action) }
  it { should allow_value('This is not too long. It is practically perfect in every way.').for(:personal_story_call_to_action) }

  describe "#petitions" do
    it { should have_many :petitions }
  end

  describe "#featured_petition" do
    it { should belong_to :featured_petition }
  end

  describe "#personal_stories" do
    it { should have_many :personal_stories }
  end

  describe "#featured_personal_story" do
    it { should belong_to :featured_personal_story }
  end

  describe "#debates" do
    it { should have_many :debates }
  end

  describe "#featured_debate" do
    it { should belong_to :featured_debate }
  end

end
