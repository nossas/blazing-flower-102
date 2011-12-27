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
    it{ should belong_to :idea_help_method }
    it{ should have_many :versions }
    it{ should have_many :merges }
  end

  describe "replace_primary" do
    before do
      @idea = Factory(:idea)
      @member = Factory(:member)
      @fork = @idea.create_fork(@member) 
      @second_fork = @idea.create_fork(@member) 
      @idea.replace_primary
    end
    context "regarding first fork" do
      subject{ @fork.reload }
      its(:parent){ should be_nil }
    end
    context "regarding another fork" do
      subject{ @second_fork.reload }
      its(:parent){ should == @fork }
    end
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
    its(:parent){ should == @idea }
  end
end
