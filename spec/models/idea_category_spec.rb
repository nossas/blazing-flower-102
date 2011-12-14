require 'spec_helper'

describe IdeaCategory do
  describe "validations and associations" do
    before do
      Factory(:idea_category)
    end
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }
    it{ should validate_presence_of :badge }
    it{ should have_many :ideas }
    it{ should belong_to :issue }
  end
end

