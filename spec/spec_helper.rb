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

WEATHER_VALID_API_RESPONSE =  
{"rss"=>{"channel"=>{"title"=>"Yahoo! Weather - Rio de Janeiro, BR", "link"=>"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html", "description"=>"Yahoo! Weather for Rio de Janeiro, BR", "language"=>"en-us", "lastBuildDate"=>"Thu, 25 Aug 2011 5:00 pm LST", "ttl"=>"60", "yweather:location"=>{"city"=>"Rio de Janeiro", "region"=>"RJ", "country"=>"Brazil"}, "yweather:units"=>{"temperature"=>"C", "distance"=>"km", "pressure"=>"mb", "speed"=>"km/h"}, "yweather:wind"=>{"chill"=>"24", "direction"=>"170", "speed"=>"11.27"}, "yweather:atmosphere"=>{"humidity"=>"83", "visibility"=>"9.99", "pressure"=>"1015.92", "rising"=>"2"}, "yweather:astronomy"=>{"sunrise"=>"6:10 am", "sunset"=>"5:41 pm"}, "image"=>{"title"=>"Yahoo! Weather", "width"=>"142", "height"=>"18", "link"=>"http://weather.yahoo.com", "url"=>"http://l.yimg.com/a/i/brand/purplelogo//uh/us/news-wea.gif"}, "item"=>{"title"=>"Conditions for Rio de Janeiro, BR at 5:00 pm LST", "geo:lat"=>"-22.98", "geo:long"=>"-43.2", "link"=>"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html", "pubDate"=>"Thu, 25 Aug 2011 5:00 pm LST", "yweather:condition"=>{"text"=>"Partly Cloudy", "code"=>"30", "temp"=>"24", "date"=>"Thu, 25 Aug 2011 5:00 pm LST"}, "description"=>"\n<img src=\"http://l.yimg.com/a/i/us/we/52/30.gif\"/><br />\n<b>Current Conditions:</b><br />\nPartly Cloudy, 24 C<BR />\n<BR /><b>Forecast:</b><BR />\nThu - Clear. High: 24 Low: 20<br />\nFri - Mostly Sunny. High: 24 Low: 20<br />\n<br />\n<a href=\"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html\">Full Forecast at Yahoo! Weather</a><BR/><BR/>\n(provided by <a href=\"http://www.weather.com\" >The Weather Channel</a>)<br/>\n", "yweather:forecast"=>[{"day"=>"Thu", "date"=>"25 Aug 2011", "low"=>"20", "high"=>"24", "text"=>"Clear", "code"=>"31"}, {"day"=>"Fri", "date"=>"26 Aug 2011", "low"=>"20", "high"=>"24", "text"=>"Mostly Sunny", "code"=>"34"}], "guid"=>"BRXX0201_2011_08_26_7_00_LST"}}, "version"=>"2.0", "xmlns:yweather"=>"http://xml.weather.yahoo.com/ns/rss/1.0", "xmlns:geo"=>"http://www.w3.org/2003/01/geo/wgs84_pos#"}} 


SHORTENED_WEATHER_VALID_API_RESPONSE = 
{"title"=>"Yahoo! Weather - Rio de Janeiro, BR", "link"=>"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html", "description"=>"Yahoo! Weather for Rio de Janeiro, BR", "language"=>"en-us", "lastBuildDate"=>"Thu, 25 Aug 2011 5:00 pm LST", "ttl"=>"60", "yweather:location"=>{"city"=>"Rio de Janeiro", "region"=>"RJ", "country"=>"Brazil"}, "yweather:units"=>{"temperature"=>"C", "distance"=>"km", "pressure"=>"mb", "speed"=>"km/h"}, "yweather:wind"=>{"chill"=>"24", "direction"=>"170", "speed"=>"11.27"}, "yweather:atmosphere"=>{"humidity"=>"83", "visibility"=>"9.99", "pressure"=>"1015.92", "rising"=>"2"}, "yweather:astronomy"=>{"sunrise"=>"6:10 am", "sunset"=>"5:41 pm"}, "image"=>{"title"=>"Yahoo! Weather", "width"=>"142", "height"=>"18", "link"=>"http://weather.yahoo.com", "url"=>"http://l.yimg.com/a/i/brand/purplelogo//uh/us/news-wea.gif"}, "item"=>{"title"=>"Conditions for Rio de Janeiro, BR at 5:00 pm LST", "geo:lat"=>"-22.98", "geo:long"=>"-43.2", "link"=>"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html", "pubDate"=>"Thu, 25 Aug 2011 5:00 pm LST", "yweather:condition"=>{"text"=>"Partly Cloudy", "code"=>"30", "temp"=>"24", "date"=>"Thu, 25 Aug 2011 5:00 pm LST"}, "description"=>"\n<img src=\"http://l.yimg.com/a/i/us/we/52/30.gif\"/><br />\n<b>Current Conditions:</b><br />\nPartly Cloudy, 24 C<BR />\n<BR /><b>Forecast:</b><BR />\nThu - Clear. High: 24 Low: 20<br />\nFri - Mostly Sunny. High: 24 Low: 20<br />\n<br />\n<a href=\"http://us.rd.yahoo.com/dailynews/rss/weather/Rio_de_Janeiro__BR/*http://weather.yahoo.com/forecast/BRXX0201_c.html\">Full Forecast at Yahoo! Weather</a><BR/><BR/>\n(provided by <a href=\"http://www.weather.com\" >The Weather Channel</a>)<br/>\n", "yweather:forecast"=>[{"day"=>"Thu", "date"=>"25 Aug 2011", "low"=>"20", "high"=>"24", "text"=>"Clear", "code"=>"31"}, {"day"=>"Fri", "date"=>"26 Aug 2011", "low"=>"20", "high"=>"24", "text"=>"Mostly Sunny", "code"=>"34"}], "guid"=>"BRXX0201_2011_08_26_7_00_LST"}} 


