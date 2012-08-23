source 'http://rubygems.org'

#Rails 3.1 update
gem 'rails', '3.1.6'
gem "mysql2", "0.3.11"
#gem 'prototype-rails', '3.1.0'
gem 'jquery-rails' # rails generate jquery:install --ui
gem 'thin' # Webrick has temporary WARN bug, nothing serious

#Rails 3.2 update
#gem 'prototype-rails', '3.2.1'

# Try to fix engineyard issue
gem 'bundler', '1.1.4'
# also there was mysql2 gem

# Pagination
gem 'will_paginate', '~> 3.0'

# Attahcment management (i.e. images)
gem 'paperclip'

# Queuing
gem 'resque', :require => 'resque/server'
gem 'resque-scheduler', :require => 'resque_scheduler'

# RSpec
group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem "capybara"
end

# Heroku works only with PostgreSQL
group :production do
  gem "pg"
end

#group :development do
  gem 'rack-mini-profiler'
#end