source :rubyforge

gem 'rails', '3.1.0.rc4'
# gem 'rails',  :git => 'git://github.com/rails/rails.git'

# gem 'state_machine'

gem 'activeadmin', :git => 'https://github.com/gregbell/active_admin.git',:branch => "rails-3-1"

# Fix for activeadmin / rails 3.1
gem "meta_search",    '>= 1.1.0.pre'
gem "fastercsv"

gem 'jquery-rails'


# Asset template engines
# gem 'haml'
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

# gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
# gem 'cancan'


# gem 'dynamic_form'

# gem 'aws-s3', :require => 'aws/s3'
gem 'newrelic_rpm'

# Database related gems
# gem 'foreigner'
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

  gem "cucumber-rails"
  gem "capybara"

  gem "database_cleaner"

  gem "awesome_print"
end

group :production do
  gem 'pg'
end
