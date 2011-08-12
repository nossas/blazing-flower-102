require 'spec_helper'

describe MembersController do
  subject{ response }
  describe "GET show" do
    context "when I do not pass an ID and ask" do
      before do
        @member = Factory(:member)
        get :show, :id => @member.id
      end
      it{ should be_success }
      it{ assigns(:member).should == @member }
    end

    context "when I pass an ID and ask" do
      before do
        @member = Factory(:member)
        get :show, :id => @member.id
      end
      it{ should be_success }
      it{ assigns(:member).should == @member }
    end
  end

end
