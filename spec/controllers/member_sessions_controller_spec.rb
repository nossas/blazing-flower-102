require 'spec_helper'

describe MemberSessionsController do
  include Devise::TestHelpers
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
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
      get :destroy
    end
    it{ session[:fb_token].should be_nil }
  end
end
