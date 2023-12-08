source "https://rubygems.org"

ruby "3.2.2"

gem "tzinfo-data" # don't rely on OS for timezone data

gem "rails"

# Drivers
gem "pg"
gem "puma"

# Redis
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'

# Assets
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "bootsnap", require: false # reduces boot times through caching; required in config/boot.rb

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "dockerfile-rails", ">= 1.5", :group => :development

gem "redis", "~> 5.0"
