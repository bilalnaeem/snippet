source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'responders', '~> 2.0'

# Temporary lock parser gem
gem "parser", "~> 2.2.0"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'\

gem "active_model_serializers", "~> 0.8.0"


gem "database_cleaner" # Strategies for cleaning databases


# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development, :test do
  gem "rspec", ">= 3.3"
  gem "byebug" # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "web-console", "~> 2.0" # Access an IRB console on exception pages or by using <%= console %> in views
  gem "rspec_api_documentation", github: "zipmark/rspec_api_documentation", require: false # Automatically generate API documentation from RSpec examples
  gem "bullet" # Check for N+1 queries. https://github.com/flyerhzm/bullet
end

group :test do
  gem "spring-commands-rspec" # Rspec command for spring
  gem "rspec-rails"
  gem "factory_girl_rails" # Create factories
  gem "fuubar" # The instafailing RSpec progress bar formatter
  gem "capybara" # Functional tests
  gem "selenium-webdriver" # Selenium webdriver client for capybara
  gem "poltergeist" # Javascript runtime (phantomjs) for capybara
  gem "database_cleaner" # Strategies for cleaning databases
  gem "timecop" # A gem providing "time travel" and "time freezing" capabilities
  gem "faker" # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc
  gem "codeclimate-test-reporter", require: false # see https://github.com/codeclimate/ruby-test-reporter
end