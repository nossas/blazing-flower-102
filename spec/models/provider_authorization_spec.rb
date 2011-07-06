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
end
