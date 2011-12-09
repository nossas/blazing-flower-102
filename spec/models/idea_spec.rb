require 'spec_helper'

describe Idea do
  describe "validations and associations" do
    before do
      Factory(:idea)
    end
    it{ should validate_presence_of :member_id }
    it{ should validate_presence_of :idea_category_id }
    it{ should validate_presence_of :issue_id }
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :headline }
    it{ should belong_to :member }
    it{ should belong_to :category }
    it{ should belong_to :issue }
  end
end
