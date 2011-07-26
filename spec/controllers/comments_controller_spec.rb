require 'spec_helper'

describe CommentsController do
  describe "POST create" do

    before do
      @member = Factory.create(:provider_authorization).member
      controller.stub!(:current_member).and_return(@member)
    end

    context "debate comment" do
      before do
        @debate = Factory.create(:debate)
        post 'create', {:debate => { :id => @debate.id }, :comment => { :content =>  "I feel very strongly about this." } }
      end

      it "should create a new comment" do
        Comment.count.should == 1 
      end

      it "should belong to a debate" do
        Comment.last.commentable.should == @debate  
      end
    end

  end
end
