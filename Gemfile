source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'resque', '~>1.24.0', :require => 'resque/server'
gem 'resque-scheduler', :require => 'resque_scheduler'
gem 'foreman', '~> 0.63.0'
gem 'jquery-rails'
gem 'sorcery'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-instagram'
gem 'omniauth-foursquare'
gem 'twitter'
gem 'instagram'
gem 'twitter-text'
gem 'chronic', '~> 0.9.1'
gem 'simple_form', '~> 2.1.0'

group :assets do
  gem 'sass-rails',      '~> 3.2.3'
  gem 'coffee-rails',    '~> 3.2.1'
  gem 'uglifier',        '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0.0'
end

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.13.0'
  #gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'pry'
end

group :test do
  gem 'guard-rspec'
  gem 'launchy'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'vcr', '~> 2.4.0'
  gem 'webmock', '~> 1.9.0'
  gem 'simplecov'
  gem 'resque_spec', '~> 0.13.0'
end
