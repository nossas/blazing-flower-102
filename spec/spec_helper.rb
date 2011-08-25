# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

# fake data for omniauth test cases
GOOGLE_CUSTOM_DOMAIN_VALID_AUTH_DATA = {
  "provider" => "google",
  "uid" => "https://www.google.com/accounts/o8/id?id=AItOawmEH3kd6WVTpQc2YhDiGGkcobh0_GY5fxE1",
  "user_info" => {
    "first_name" => "Ren",
    "last_name" => "Provey",
    "name" => "Ren Provey"
  },
}

GOOGLE_APP_VALID_AUTH_DATA = {
  "provider" => "google",
  "uid" => "https://www.google.com/accounts/o8/id?id=AItOawmEH3kd6WVTpQc2YhDiGGkcobh0_GY5fxE",
  "user_info" => {
    "email" => "ren.provey@gmail.com"
  },
  "first_name" => "Ren",
  "last_name" => "Provey",
  "name" => "Ren Provey"
}

GOOGLE_APP_INVALID_AUTH_DATA = {
  "provider" => "google",
  "uid" => "https://www.google.com/accounts/o8/id?id=AItOawmEH3kd6WVTpQc2YhDiGGkcobh0_GY5fxE",
  "user_info" => {
    "email" => "bad_email"
  },
  "first_name" => "Ren",
  "last_name" => "Provey",
  "name" => "Ren Provey"
}

FACEBOOK_INVALID_AUTH_DATA = {
      "provider"=>"facebook",
      "uid"=>"547955110",
      "credentials"=>{"token"=>"fake_token"},
      "user_info"=>{"nickname"=>nil,
                    "email"=>"diogob@gmail.com",
                    "first_name"=>"Diogo",
                    "last_name"=>"Biazus",
                    "name"=>"Diogo Biazus",
                    "image"=>"http://graph.facebook.com/547955110/picture?type=square",
                    "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=547955110",
                             "Website"=>nil}},
      "extra"=>{"user_hash"=>{"id"=>"547955110",
                             "name"=>"Diogo Biazus",
                             "first_name"=>"Diogo",
                             "last_name"=>"Biazus",
                             "link"=>"http://www.facebook.com/profile.php?id=547955110",
                             "bio"=>"I simply am not there",
                             "work"=> [],
                             "gender"=>"male",
                             "email"=>"diogo",
                             "timezone"=>-3,
                             "locale"=>"pt_BR",
                             "verified"=>true,
                             "updated_time"=>"2011-05-20T16:11:58+0000"}}}
FACEBOOK_VALID_AUTH_DATA = {
      "provider"=>"facebook",
      "uid"=>"547955110",
      "credentials"=>{"token"=>"fake_token"},
      "user_info"=>{"nickname"=>nil,
                    "email"=>"diogob@gmail.com",
                    "first_name"=>"Diogo",
                    "last_name"=>"Biazus",
                    "name"=>"Diogo Biazus",
                    "image"=>"http://graph.facebook.com/547955110/picture?type=square",
                    "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=547955110",
                             "Website"=>nil}},
      "extra"=>{"user_hash"=>{"id"=>"547955110",
                             "name"=>"Diogo Biazus",
                             "first_name"=>"Diogo",
                             "last_name"=>"Biazus",
                             "link"=>"http://www.facebook.com/profile.php?id=547955110",
                             "bio"=>"I simply am not there",
                             "work"=> [],
                             "gender"=>"male",
                             "email"=>"diogob@gmail.com",
                             "timezone"=>-3,
                             "locale"=>"pt_BR",
                             "verified"=>true,
                             "updated_time"=>"2011-05-20T16:11:58+0000"}}}

TWITTER_VALID_TIMELINE_RESPONSE = [
  {"user" => 
    {"statuses_count" => 2,"screen_name" => "Meu_Rio","id" => 295834140},
    "in_reply_to_status_id" => nil,
    "created_at" => "Wed Aug 24 17:30:51 +0000 2011",
    "id_str" => "106418202430545920",
    "id" => 106418202430545920,"text" => "Estamos trabalhando duro em nossa primeira campanha!"
  },
  {"user" => 
    {"statuses_count" => 2,"screen_name" => "Meu_Rio","id" => 295834140,},
    "in_reply_to_user_id" => nil,
    "created_at" => "Wed Aug 24 15:58:20 +0000 2011",
    "id_str" => "106394922780868608",
    "id" => 106394922780868608,
    "text" => "Oi Pessoal! Tudo Bem?"
  }
]

