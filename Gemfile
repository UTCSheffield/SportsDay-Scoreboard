source "https://rubygems.org"

ruby "3.2.2"

gem "tzinfo-data" # don't rely on OS for timezone data

gem "rails"

# Drivers
gem "pg"
gem "puma"

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
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Auth
gem "jwt"
gem "httparty"
gem 'web-console', '~> 4.2', '>= 4.2.1'

gem "dockerfile-rails", ">= 1.5", :group => :development
