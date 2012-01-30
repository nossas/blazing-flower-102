source "http://rubygems.org"
source "http://gems.github.com"

# gem 'rails',  :git => 'git://github.com/rails/rails.git', :branch => '3-1-stable'
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
gem 'twitter'
gem 'aws-s3'
gem 'httparty'

# Asset template engines
gem 'haml'
gem 'slim'

# Model extensions
gem 'auto_html'

# Asset template engines
group :assets do
  gem 'sass-rails'
  gem "compass", "~> 0.12.alpha.0"
  gem 'compass-960-plugin'
  gem 'coffee-script'
  gem 'uglifier'
end

# Temporary pulling current sprockets source, to avoid plethora of output while tests run
gem 'sprockets'

gem 'state_machine'
gem 'delayed_job'

# Database related gems
gem 'pg'
gem 'foreigner'

gem 'dalli'
gem 'paperclip'
gem 'fog'
gem 'carrierwave'

# Including so we can run the complete petition rake task for demos
gem 'factory_girl_rails'
gem "faker"

# View helpers
gem 'kaminari'
gem 'simple_form'

gem "simplecov", :require => false, :group => :test

gem 'newrelic_rpm'

group :development, :test do
  gem "jasmine", :git => "https://github.com/pivotal/jasmine-gem.git", :branch => "1.2.rc1"
  gem 'heroku'
  gem 'sqlite3', '1.3.3'
  gem 'foreman'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "edgecase-git-pair"

  gem "rspec-rails", "~> 2.6"
  gem "shoulda-matchers"

  gem "mailcatcher"

  gem "autotest-rails"
  gem "autotest-growl"
  # gem "autotest-fsevent"

  gem "cucumber-rails"
  gem "capybara"

  gem "database_cleaner"

  gem "awesome_print"
  gem "fakeweb"
end

group :production do
  # Performance Monitoring
  # gem 'newrelic_rpm'

  # Heroku Cedar needs to have the webserver specified (otherwise it will run webrick)
  gem 'thin'
end

gem "koala"
