source "http://rubygems.org"
source "http://gems.github.com"

gem 'rails', '~> 3.1'
gem 'jquery-rails'
gem 'inherited_resources'

# Authentication and Permissions
gem "devise", "~> 1.4.2"
gem 'cancan'

# Administration
gem 'activeadmin'
gem 'thin'
gem "rest-client"

# External authentication
gem "oa-oauth", :require => "omniauth/oauth"
gem 'oa-openid', :require => 'omniauth/openid'

# External apis
gem 'aws-s3'
gem 'httparty'

# Asset template engines
gem 'haml'
gem 'slim'

# Model extensions
gem 'auto_html'

# Asset template engines
group :assets do
  gem "compass-rails"
  gem 'compass-960-plugin', :git => "https://github.com/runeroniek/compass-960-plugin.git"
  gem 'sass-rails', '~> 3.1.3'
  gem 'coffee-script'
  gem 'uglifier'
  gem 'therubyracer'
end

# Temporary pulling current sprockets source, to avoid plethora of output while tests run
gem 'sprockets'
gem 'state_machine'
gem 'delayed_job'

# Database related gems
gem 'pg'
gem 'foreigner'

# Cache + Upload
gem 'dalli'
gem 'paperclip'
gem 'fog'
gem 'carrierwave'
gem 'has_scope'
gem 'kaminari'
gem 'simple_form'

group :development do
  gem "taps"
  gem 'foreman'
end

group :production do
  gem 'newrelic_rpm'
end

group :development, :test do
  gem "rspec-rails", "~> 2.6"
end

group :test do
  gem "shoulda-matchers"
  gem "edgecase-git-pair"
  gem "autotest-rails"
  gem "autotest-growl"
  gem "cucumber-rails", require: false
  gem "capybara"
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "awesome_print"
  gem "fakeweb"
  gem "factory_girl_rails", "~> 1.0.1"
  gem "faker"
end


gem "koala"
gem 'doorkeeper', '~> 0.3.0'
