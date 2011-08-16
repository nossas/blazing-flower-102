require 'spec_helper'

describe Debate do

  it { should validate_presence_of :title }
  it { should validate_presence_of :question }
  it { should validate_presence_of :comment_prompt }
  it { should validate_presence_of :author_email_side_1 }
  it { should validate_presence_of :author_email_side_2 }

  describe "#distinct_member_count" do
    let(:debate) { Factory(:debate) }
    subject{ debate.distinct_member_count }

    context "when we have no comments" do
      it { should == 0 }
    end

    context "when we have two comments from different members" do
      before do
        2.times{ Factory(:debate_comment, :commentable => debate) }
      end
      it { should == 2 }
    end

    context "when we have two comments from the same member" do
      before do
        @member = Factory(:provider_authorization).member
        2.times{ Factory(:debate_comment, :commentable => debate, :member => @member) }
      end
      it { should == 1 }
    end

    context "when we have one comment" do
      before do
        Factory(:debate_comment, :commentable => debate)
      end
      it { should == 1 }
    end
  end

end
