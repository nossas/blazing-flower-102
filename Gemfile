source :rubyforge

# gem 'rails',  :git => 'git://github.com/rails/rails.git', :branch => '3-1-stable'
gem 'rails', '3.1.0.rc4'
gem 'jquery-rails'

# Asset template engines
gem 'haml'
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'activeadmin', :git => 'https://github.com/gregbell/active_admin.git', :branch => "rails-3-1"
# gem 'activeadmin'

# 3 Fixes for activeadmin / rails 3.1
gem "meta_search",    '>= 1.1.0.pre'
gem "fastercsv"
gem "kaminari"

# Fix for Heroku, try upgrading with Rails 3.1
gem "rake", "0.8.7"

gem 'state_machine'
gem 'paperclip'

gem 'cancan'

# gem 'dynamic_form'

gem 'aws-s3'
gem 'newrelic_rpm'

# Database related gems
gem 'pg'
gem 'foreigner'

# gem 'geokit-rails3'

group :development, :test do
  gem 'heroku'
  gem 'unicorn'
  gem 'sqlite3'
  gem 'foreman'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "edgecase-git-pair"

  gem "rspec-rails", "~> 2.6"
  gem 'factory_girl_rails'
  gem "shoulda-matchers"

  gem "mailcatcher"

  gem 'jasmine'

  gem "autotest-rails"
  gem "autotest-growl"
  gem "autotest-fsevent"

  gem "cucumber-rails"
  gem "capybara"

  gem "database_cleaner"

  gem "awesome_print"
end

group :production do
  # Heroku Cedar needs to have the webserver specified (otherwise it will run webrick)
  gem 'thin'

  # The below is a fix until Rails 3.1rc5 arrives
  gem 'therubyracer-heroku', '0.8.1.pre3'
end
