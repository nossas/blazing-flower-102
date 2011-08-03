require 'spec_helper'

describe Issue do
  it { should validate_presence_of :name } 

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
