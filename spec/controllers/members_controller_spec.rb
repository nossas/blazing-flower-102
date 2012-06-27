require 'spec_helper'

describe MembersController do
  subject{ response }

  describe "GET index" do
    context "When it's a valid token" do
      before do
        ENV['DASH_TOKEN'] = "HelloThisIsDog"
        get :index, token: "HelloThisIsDog", format: :json
      end
      its(:status) { should == 200 }
    end
    context "When it's an invalid token" do
      before do
        get :index, token: "HelloThisIsNotDog", format: :json
      end
      its(:status) { should == 401 }
    end


  end

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
