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

  describe "#create_fork" do
    before do
      @idea = Factory(:idea)
      @member = Factory(:member)
    end
    subject{ @idea.create_fork(@member) }
    its(:member){ should == @member }
    its(:category){ should == @idea.category }
    its(:issue){ should == @idea.issue }
  
  end
end
