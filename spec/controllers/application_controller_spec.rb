require 'spec_helper'

describe ApplicationController do
  describe "#facebook_logout" do
    before do
      session[:fb_token] = "api_key|session_key"
      get :facebook_logout
    end
    subject{ response }
    it{ session[:fb_token].should be_nil }
    it{ should redirect_to( "http://www.facebook.com/logout.php?api_key=api_key&session_key=session_key&confirm=1&next=#{destroy_member_session_url}") }
  end
end
