# coding: utf-8

require 'spec_helper'

describe OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:member]
  end

  describe "GET facebook" do
    subject{ get :facebook }
    it "should store the facebook token " do
      controller.stub(:auth_data).and_return(FACEBOOK_VALID_AUTH_DATA) 
      subject
      session[:fb_token].should == 'fake_token'
    end

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
        flash[:welcome].should == "<b>Seja bem-vindo!</b> Agora você faz parte da comunidade do Meu Rio."
      end
      it "should send a welcome email" do
        subject
        ActionMailer::Base.deliveries.first.to.should == ["diogob@gmail.com"]
      end

      context "with already existing provider_authorization" do
        before do
          p = ProviderAuthorization.find_for_facebook_oauth(FACEBOOK_VALID_AUTH_DATA, nil)
          p.update_attributes(:created_at => 2.hours.ago)
        end

        it "should not set a flash notice" do
          subject
          flash[:welcome].should == nil
        end
      end
    end
  end


  describe "GET google" do
    subject{ get :google }
    it "should make session[:google_login] true" do
      controller.stub(:auth_data).and_return(GOOGLE_APP_VALID_AUTH_DATA) 
      subject
      session[:google_login].should be_true
    end

    it 'should call find_for_google_oauth' do
      controller.stub(:auth_data).and_return(GOOGLE_APP_VALID_AUTH_DATA) 
      ProviderAuthorization.should_receive(:find_for_google_oauth).with(GOOGLE_APP_VALID_AUTH_DATA, nil).and_return(Factory(:provider_authorization))
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

    context "with right auth data" do
      before{ controller.stub(:auth_data).and_return(GOOGLE_APP_VALID_AUTH_DATA) }
      it{ expect{subject}.to change{Member.count}.by(1) }
      it{ expect{subject}.to change{ProviderAuthorization.count}.by(1) }
      it{ should redirect_to(root_path) }
      it "should set a flash notice" do
        subject
        flash[:welcome].should == "<b>Seja bem-vindo!</b> Agora você faz parte da comunidade do Meu Rio."
      end
      it "should send a welcome email" do
        subject
        ActionMailer::Base.deliveries.first.to.should == ["ren.provey@gmail.com"]
      end

      context "with already existing provider_authorization" do
        before do
          p = ProviderAuthorization.find_for_google_oauth(GOOGLE_APP_VALID_AUTH_DATA, nil)
          p.update_attributes(:created_at => 2.hours.ago)
        end

        it "should not set a flash notice" do
          subject
          flash[:welcome].should == nil
        end
      end
    end
  end
end
