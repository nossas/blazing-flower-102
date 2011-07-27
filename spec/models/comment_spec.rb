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

  describe "#reject" do
    subject{ Factory(:comment_awaiting_moderation).tap{|c| c.reject } }
    its(:comment_accepted){ should be_false }
  end

  describe "#accept" do
    subject{ Factory(:comment_awaiting_moderation).tap{|c| c.accept } }
    its(:comment_accepted){ should be_true }
  end

  describe ".visible" do
    subject{ Comment.visible }
    context "with comments awaiting moderation" do
      before do
        @debate_comment = Factory(:comment_awaiting_moderation)
      end
      it{ should be_empty }
    end

    context "with comments not on moderation queue" do
      before do
        @debate_comment = Factory(:debate_comment)
      end
      it{ should == [ @debate_comment ] }
    end

    context "with one moderated to yes comment and one moderated to no" do
      before do
        @debate_comment = Factory(:moderated_comment)
        moderated_to_no_comment = Factory(:moderated_comment)
        moderated_to_no_comment.update_attribute :comment_accepted, false
      end
      it{ should == [ @debate_comment ] }
    end
  end

  describe ".moderated" do
    subject{ Comment.moderated }
    context "with no moderated comments" do
      before do
        @debate_comment = Factory(:comment_awaiting_moderation)
        Factory(:debate_comment)
      end
      it{ should be_empty }
    end

    context "with moderated comments" do
      before do
        @debate_comment = Factory(:moderated_comment)
        Factory(:debate_comment)
      end
      it{ should == [ @debate_comment ] }
    end
  end

  describe ".awaiting_moderation" do
    subject{ Comment.awaiting_moderation }
    context "with less flags than MODERATION_THRESHOLD" do
      before do
        @debate_comment = Factory(:debate_comment)
        (Comment::MODERATION_THRESHOLD - 1).times{ @debate_comment.flags.create :member => Factory(:provider_authorization).member }
        Factory(:debate_comment)
      end
      it{ should be_empty }
    end

    context "with moderated comments" do
      before do
        @debate_comment = Factory(:comment_awaiting_moderation)
        Factory(:moderated_comment)
        Factory(:debate_comment)
      end
      it{ should == [ @debate_comment ] }
    end

    context "with MODERATION_THRESHOLD flags" do
      before do
        @debate_comment = Factory(:comment_awaiting_moderation)
        Factory(:debate_comment)
      end
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
