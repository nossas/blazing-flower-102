require "#{Rails.root}/spec/spec_helper"

Before('@omniauth_test') do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = FACEBOOK_VALID_AUTH_DATA
  OmniAuth.config.mock_auth[:google] = GOOGLE_APP_VALID_AUTH_DATA
  Koala::Facebook::GraphAPI.any_instance.stub(:get_connections).with("me", "friends").and_return([{"name"=>"Alessandra Orofino", "id"=>"2630"}])
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
