require 'spec_helper'

describe CommentFlag do
  describe "#valid?" do
    it { should validate_presence_of :member_id }
    it { should validate_presence_of :comment_id }
    context "with an already exisiting" do
      before do
        Factory(:comment_flag)
      end

      it { should validate_uniqueness_of(:member_id).scoped_to(:comment_id) }
    end
  end
end
