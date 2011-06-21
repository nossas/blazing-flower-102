source 'http://rubygems.org'

gem 'rails', '3.1.0.rc3'
#gem 'rails',  :git => 'git://github.com/rails/rails.git'
gem 'inherited_resources'
gem 'has_scope'

gem 'state_machine'

# Asset template engines
gem 'haml'
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'devise', :git => 'git://github.com/plataformatec/devise.git'

gem 'jquery-rails'

gem 'aws-s3', :require => 'aws/s3'
gem 'newrelic_rpm'

# Database related gems
gem 'foreigner'
#gem 'geokit-rails3'

group :development, :test do
  gem 'heroku'
  gem 'unicorn'
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "edgecase-git-pair"

  gem "rspec-rails", "~> 2.6"
  gem 'factory_girl_rails'
  gem "shoulda-matchers"

  gem 'jasmine'

  gem "autotest-rails"
  gem "autotest-growl"
  gem "autotest-fsevent"

  gem "capybara"

  gem "awesome_print"
end

group :production do
  gem 'pg'
end
