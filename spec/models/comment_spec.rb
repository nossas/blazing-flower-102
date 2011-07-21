require 'spec_helper'

describe Comment do
  it {should validate_presence_of :content}
  it {should validate_presence_of :member_id}
  it {should validate_presence_of :commentable_id}
  it {should validate_presence_of :commentable_type}
  
  describe "debate comment" do
    before do
      @debate_comment = Factory(:debate_comment)
    end

    it "should respond to debate methods" do
      @debate_comment.commentable.should == Debate.first
    end
  end
end
