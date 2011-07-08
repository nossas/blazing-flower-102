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
    context "when both provider authorization and member do not exist" do
      subject{ ProviderAuthorization.find_for_facebook_oauth(FACEBOOK_VALID_AUTH_DATA) }
      it{ should be_persisted }
      its(:provider){ should == 'facebook' }
      its(:uid){ should == FACEBOOK_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == FACEBOOK_VALID_AUTH_DATA['extra']['user_hash']['email'] }
    end
  end

  describe ".find_for_google_apps_oauth" do
    context "when both provider authorization and member do not exist" do
      subject{ ProviderAuthorization.find_for_google_apps_oauth(GOOGLE_APP_VALID_AUTH_DATA) }
      it{ should be_persisted }
      its(:provider){ should == 'google_apps' }
      its(:uid){ should == GOOGLE_APP_VALID_AUTH_DATA['uid'] }
      its(:member){ subject.email.should == GOOGLE_APP_VALID_AUTH_DATA['user_info']['email'] }
    end
  end
end
