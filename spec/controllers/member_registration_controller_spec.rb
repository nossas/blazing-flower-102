require 'spec_helper'

describe MemberRegistrationController do
  include Devise::TestHelpers
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
  end
  
  subject{ response }
  describe "POST create" do
    context "new member" do
      before do
        post :create, { :member =>{"first_name"=>"John", "last_name"=>"Smith", "email"=>"john@smith.edu", "password"=>"unsafe", "password_confirmation"=>"unsafe"} }
      end

      it "should create a new member" do
        Member.count.should == 1
      end

      it "should set correct flags" do
        member = Member.first
        member.has_login.should == true
        member.has_non_oauth_login.should == true
      end
      
    end
  end
end
