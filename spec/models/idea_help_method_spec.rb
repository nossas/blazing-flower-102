require 'spec_helper'

describe IdeaHelpMethod do
  describe "validations and associations" do
    before do
      Factory(:idea_help_method)
    end
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of(:name).scoped_to(:issue_id) }
    it{ should have_many :ideas }
    it{ should belong_to :issue }
  end
end

