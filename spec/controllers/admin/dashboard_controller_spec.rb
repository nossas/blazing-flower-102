require 'spec_helper'

describe Admin::DashboardController do

  describe "unauthenticated user" do
    describe "GET 'index'" do
      it "should be not be successful" do
        get 'index'

        response.code.should eq("302")
        response.should redirect_to(new_user_session_path)
      end
    end
  end

  describe "authenticated user" do
    before do
      @user = Factory(:user)
      sign_in @user
    end

    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end
  end

end
