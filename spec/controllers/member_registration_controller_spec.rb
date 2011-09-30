require 'spec_helper'

describe MemberRegistrationController do
  include Devise::TestHelpers
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
  end
  
  subject{ response }
  describe "POST create" do
    context "new member with correct information" do
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

    context "new member with incorrect information" do
      before do
        post :create, { :member =>{"first_name"=>"John", "last_name"=>"Smith", "email"=>"john@smith.edu", "password"=>"unsafe", "password_confirmation"=>"super_safe"} }
      end

      it "should not create a new member" do
        Member.count.should == 0
      end

    end

    context "member who has already signed a petition" do
      before do
        @member = Factory.create(:petition_signature).member

        post :create, {:member => {:first_name => "#{@member.first_name}", :last_name => "#{@member.last_name}", :email => "#{@member.email}", :password => "pw", :password_confirmation => "pw"} }
      end

      it "should not create a new member" do
        Member.count.should == 1
      end

      it "should set the correct flags" do
        @member = Member.first
        @member.has_login.should == true
        @member.has_non_oauth_login.should == true
      end
    end

    context "member who has already signed through a third party service" do
      before do
        @member = Factory.create(:provider_authorization).member
        post :create, {:member => {:first_name => "#{@member.first_name}", :last_name => "#{@member.last_name}", :email => "#{@member.email}", :password => "pw", :password_confirmation => "pw"} }
      end

      it "should not create a new member" do
        Member.count.should == 1
      end

      it "should not reset the has_non_oauth_login flag" do
        Member.first.has_non_oauth_login.should == false
      end
    end
  end
end
