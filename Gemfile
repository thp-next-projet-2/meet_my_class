# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby File.read('./.ruby-version')
File.read('./.ruby-version')

gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3', '>= 4.3.1'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.6.0'
gem 'devise-i18n', '~> 1.8'
gem 'dotenv-rails', '~> 2.7.2'
gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit', '~> 2.0', '>= 2.0.1'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'sentry-raven', '~> 2.9.0'
gem 'sidekiq'
gem 'simple_form', '~> 4.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.0'
  gem 'letter_opener'
  gem 'skylight'
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.4'
  gem 'awesome_print'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'codecov', require: false
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'webdrivers', '~> 3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
