# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 6.0.0.rc1'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'administrate', git: 'https://github.com/thoughtbot/administrate.git'
gem 'braintree'
gem 'figaro'
gem 'flutie'
gem 'high_voltage'
gem 'inline_svg'
gem 'phony_rails'
gem 'pundit'
gem 'sentry-raven'
gem 'slim-rails'

gem 'pry-rails'

gem 'devise'

gem 'simple_form'

gem 'memery'

gem 'slack-notifier'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'factory_bot', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'image_optim', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'system_test_html_screenshots'
  gem 'webdrivers'
end
