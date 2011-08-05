require 'spec_helper'

describe MemberSessionsController do
  include Devise::TestHelpers
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
  end

  describe "#logout_google" do
    before do
      session[:google_login] = true
      get :google_logout
    end
    subject{ response }
    it{ should redirect_to("https://www.google.com/accounts/Logout") }
  end

  describe "#logout_facebook" do
    before do
      session[:fb_token] = "api_key|session_key"
      get :facebook_logout
    end
    subject{ response }
    it{ should redirect_to( "http://www.facebook.com/logout.php?api_key=api_key&session_key=session_key&confirm=1&next=#{destroy_member_session_url}") }
  end

  describe "#destroy" do
    before do
      sign_in Factory(:member)
      session[:fb_token] = "api_key|session_key"
      session[:google_login] = true
      get :destroy
    end
    it{ session[:fb_token].should be_nil }
    it{ session[:google_login].should be_nil }
  end
end
