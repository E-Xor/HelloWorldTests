source 'http://rubygems.org'

gem 'rails',                   '~> 3.2.12'
gem "mysql2",                  '~> 0.3.11'
gem 'jquery-rails'                       # rails generate jquery:install --ui
gem 'thin'                               # Webrick has temporary WARN bug, nothing serious

gem 'will_paginate',            '~> 3.0' # Pagination
gem 'paperclip'                          # Attahcment management (i.e. images)
gem 'resque', :require => 'resque/server' # Queuing
gem 'resque-scheduler', :require => 'resque_scheduler' # Queuing
gem 'state_machine',            '~> 1.1.2' # State machine
gem 'client_side_validations',  '~> 3.2.1' # JS validation
gem 'yajl-ruby',                '~> 1.1.0' # By default Rails doesn't parse JSON request
gem 'koala'
gem 'unicorn'

group :development do
  gem 'rack-mini-profiler' # Test tool with load times in the corner
  gem 'better_errors'      # More descriptive UI errors
end

# RSpec
group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem "capybara"
end

# Heroku works only with PostgreSQL
group :production do
  gem "pg"
end
