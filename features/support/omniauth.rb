require "#{Rails.root}/spec/spec_helper"

Before('@omniauth_test') do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = FACEBOOK_VALID_AUTH_DATA
  OmniAuth.config.mock_auth[:google] = GOOGLE_APP_VALID_AUTH_DATA
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
