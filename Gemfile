source :rubyforge

# gem 'rails',  :git => 'git://github.com/rails/rails.git', :branch => '3-1-stable'
gem 'rails', '~> 3.1'
gem 'jquery-rails'

# Authentication and Permissions
gem "devise", "~> 1.4.2"
gem 'cancan'

gem 'activeadmin', :git => 'git://github.com/gregbell/active_admin.git'
# We need to run development using thin until active_admin is patched
gem 'thin'

# External authentication
gem "oa-oauth", :require => "omniauth/oauth"
gem 'oa-openid', :require => 'omniauth/openid'

# External apis
gem 'twitter'
gem 'aws-s3'
gem 'httparty'

# Asset template engines
gem 'haml'

# Asset template engines
group :assets do
  gem 'sass-rails'
  gem 'coffee-script'
  gem 'uglifier'
end

# Temporary pulling current sprockets source, to avoid plethora of output while tests run
gem 'sprockets'

gem 'state_machine'
gem 'paperclip'
gem 'delayed_job'

# Database related gems
gem 'pg'
gem 'foreigner'

gem 'dalli'

# Including so we can run the complete petition rake task for demos
gem 'factory_girl_rails'
gem "faker"

gem 'inherited_resources'
gem 'kaminari'

gem "simplecov", :require => false, :group => :test

gem 'newrelic_rpm'

group :development, :test do
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
