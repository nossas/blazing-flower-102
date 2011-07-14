require 'spec_helper'

describe ProviderAuthorization do
  it { should validate_presence_of :member_id }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }
  it { 
    Factory(:provider_authorization)
    should validate_uniqueness_of(:provider).scoped_to(:member_id)
  }
  it { 
    Factory(:provider_authorization)
    should validate_uniqueness_of(:uid).scoped_to(:provider)
  }

  describe ".find_for_facebook_oauth" do
    subject{ ProviderAuthorization.find_for_facebook_oauth(FACEBOOK_VALID_AUTH_DATA) }

    context "when both provider authorization and member do not exist" do
      it{ should be_persisted }
      its(:provider){ should == 'facebook' }
      its(:uid){ should == FACEBOOK_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == FACEBOOK_VALID_AUTH_DATA['extra']['user_hash']['email'] }
      it{ expect{subject}.should change{Member.count}.by(1) }
      it{ expect{subject}.should change{ProviderAuthorization.count}.by(1) }
    end

    context "when only the provider authorization does not exist" do
      before {@member = Factory(:member, :email => FACEBOOK_VALID_AUTH_DATA['extra']['user_hash']['email'])}
      it{ should be_persisted }
      its(:provider){ should == 'facebook' }
      its(:uid){ should == FACEBOOK_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == FACEBOOK_VALID_AUTH_DATA['extra']['user_hash']['email'] }
      it{ expect{subject}.should_not change{Member.count} }
      it{ expect{subject}.should change{ProviderAuthorization.count}.by(1) }
    end

    context "when both provider authorization and member exist" do

      before do
        @member = Factory(:member, :email => FACEBOOK_VALID_AUTH_DATA['extra']['user_hash']['email'])
        @provider_authorization = Factory(:provider_authorization, :uid => FACEBOOK_VALID_AUTH_DATA['uid'], :member => @member, :provider => "facebook")
      end

      it{ should be_persisted }
      its(:provider){ should == 'facebook' }
      its(:uid){ should == FACEBOOK_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == FACEBOOK_VALID_AUTH_DATA['extra']['user_hash']['email']}
      it{ expect{subject}.should_not change{Member.count} }
      it{ expect{subject}.should_not change{ProviderAuthorization.count} }
    end


  end

  describe ".find_for_google_apps_oauth" do
    subject{ ProviderAuthorization.find_for_google_apps_oauth(GOOGLE_APP_VALID_AUTH_DATA) }

    context "when both provider authorization and member do not exist" do
      it{ should be_persisted }
      its(:provider){ should == 'google_apps' }
      its(:uid){ should == GOOGLE_APP_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == GOOGLE_APP_VALID_AUTH_DATA['user_info']['email'] }
      it{ expect{subject}.should change{Member.count}.by(1) }
      it{ expect{subject}.should change{ProviderAuthorization.count}.by(1) }
    end

    context "when only the provider authorization does not exist" do
      before {@member = Factory(:member, :email => GOOGLE_APP_VALID_AUTH_DATA['user_info']['email'])}
      it{ should be_persisted }
      its(:provider){ should == 'google_apps' }
      its(:uid){ should == GOOGLE_APP_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == GOOGLE_APP_VALID_AUTH_DATA['user_info']['email'] }
      it{ expect{subject}.should_not change{Member.count} }
      it{ expect{subject}.should change{ProviderAuthorization.count}.by(1) }
    end

    context "when both provider authorization and member exist" do

      before do
        @member = Factory(:member, :email => GOOGLE_APP_VALID_AUTH_DATA['user_info']['email'])
        @provider_authorization = Factory(:provider_authorization, :uid => GOOGLE_APP_VALID_AUTH_DATA['uid'], :member => @member, :provider => "google_apps")
      end

      it{ should be_persisted }
      its(:provider){ should == 'google_apps' }
      its(:uid){ should == GOOGLE_APP_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == GOOGLE_APP_VALID_AUTH_DATA['user_info']['email'] }
      it{ expect{subject}.should_not change{Member.count} }
      it{ expect{subject}.should_not change{ProviderAuthorization.count} }
    end

  end
end
