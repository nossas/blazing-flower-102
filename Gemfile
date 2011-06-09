source 'http://rubygems.org'

# gem 'rails', '3.1.0.rc3'
gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

gem 'aws-s3', :require => 'aws/s3'
gem 'newrelic_rpm'

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

  gem "autotest"
  gem "capybara"
end

group :production do
  gem 'pg'
end
