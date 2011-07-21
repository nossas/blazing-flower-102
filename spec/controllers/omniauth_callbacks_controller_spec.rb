require 'spec_helper'

describe OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
  end
  describe "GET facebook" do
    subject{ get :facebook }
    it 'should call find_for_facebook_oauth' do
      controller.stub(:auth_data).and_return(FACEBOOK_VALID_AUTH_DATA) 
      ProviderAuthorization.should_receive(:find_for_facebook_oauth).with(FACEBOOK_VALID_AUTH_DATA, nil).and_return(Factory(:provider_authorization))
      subject
    end
    context "with wrong auth data" do
      before{ controller.stub(:auth_data).and_return(FACEBOOK_INVALID_AUTH_DATA) }
      it{ expect{subject}.to_not change{Member.count} }
      it{ expect{subject}.to_not change{ProviderAuthorization.count} }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:notice].should == 'You were unable to login'
      end
    end
    context "with right auth data" do
      before{ controller.stub(:auth_data).and_return(FACEBOOK_VALID_AUTH_DATA) }
      it{ expect{subject}.to change{Member.count}.by(1) }
      it{ expect{subject}.to change{ProviderAuthorization.count}.by(1) }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:notice].should == 'Welcome Diogo Biazus'
      end
    end
  end


  describe "GET google_apps" do
    subject{ get :google_apps }
    it 'should call find_for_google_apps_oauth' do
      controller.stub(:auth_data).and_return(GOOGLE_APP_VALID_AUTH_DATA) 
      ProviderAuthorization.should_receive(:find_for_google_apps_oauth).with(GOOGLE_APP_VALID_AUTH_DATA, nil).and_return(Factory(:provider_authorization))
      subject
    end

    context "with wrong auth data" do
      before{ controller.stub(:auth_data).and_return(GOOGLE_APP_INVALID_AUTH_DATA) }
      it{ expect{subject}.to_not change{Member.count} }
      it{ expect{subject}.to_not change{ProviderAuthorization.count} }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:notice].should == 'You were unable to login'
      end
    end

    context "with right auth data but missing email" do
      before{ controller.stub(:auth_data).and_return(GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA) }
      it{ @response.should be_successful }
      it "should set auth_data in session" do
        ProviderAuthorization.stub(:find_for_google_apps_oauth).and_return(nil)
        subject
        session[:auth_data].should == GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA 
      end
    end

    context "with right auth data" do
      before{ controller.stub(:auth_data).and_return(GOOGLE_APP_VALID_AUTH_DATA) }
      it{ expect{subject}.to change{Member.count}.by(1) }
      it{ expect{subject}.to change{ProviderAuthorization.count}.by(1) }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:notice].should == 'Welcome Ren Provey'
      end
    end
  end

  describe "POST google_custom_domain_complete" do
    before do
      session[:auth_data] = GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA
      controller.stub(:auth_data).and_return(GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA)
    end

    after do
      session.delete(:auth_data)
    end

    subject{ post :google_custom_domain_complete, :email => 'foo@bar.com' }

    it "should create a provider authorization and call gmail passing it" do
      expect{subject}.to change{ProviderAuthorization.count}.by(1)
    end
  end
end
