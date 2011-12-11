require 'spec_helper'

describe IdeaMerge do
  describe "validations and associations" do
    it{ should belong_to :idea }
    it{ should belong_to :from }
    it{ should validate_presence_of :idea_id }
    it{ should validate_presence_of :from_id }
  end
end
