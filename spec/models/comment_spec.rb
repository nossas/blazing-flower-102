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
        (Comment::MODERATION_THRESHOLD - 1).times{ @debate_comment.flags.create :member => Factory(:provider_authorization).member }
        Factory(:debate_comment)
      end
      subject{ Comment.waiting_moderation }
      it{ should be_empty }
    end

    context "with MODERATION_THRESHOLD flags" do
      before do
        @debate_comment = Factory(:comment_awaiting_moderation)
        Factory(:debate_comment)
      end
      subject{ Comment.waiting_moderation }
      it{ should == [ @debate_comment ] }
    end
  end

  describe "#validate_member_has_profile" do
    context "when member has a profile" do
      subject do
        Comment.new(:commentable => Factory(:debate), :member => Factory(:provider_authorization).member).validate_member_has_profile
      end
      it{ should be_nil }
    end

    context "when member has no profile" do
      subject do
        Comment.new(:commentable => Factory(:debate), :member => Factory(:member)).validate_member_has_profile
      end
      it{ should include("Member should have a profile to comment.") }
    end
  end
end
