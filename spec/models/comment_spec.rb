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

  describe ".waiting_moderation" do
    context "with less flags than MODERATION_THRESHOLD" do
      before do
        @debate_comment = Factory(:debate_comment)
        (Comment::MODERATION_THRESHOLD - 1).times{ @debate_comment.flags.create :member => Factory(:member) }
        Factory(:debate_comment)
      end
      subject{ Comment.waiting_moderation }
      it{ should be_empty }
    end

    context "with MODERATION_THRESHOLD flags" do
      before do
        @debate_comment = Factory(:debate_comment)
        Comment::MODERATION_THRESHOLD.times{ @debate_comment.flags.create :member => Factory(:member) }
        Factory(:debate_comment)
      end
      subject{ Comment.waiting_moderation }
      it{ should == [ @debate_comment ] }
    end
  end
end
