source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "foreman"

gem "font-awesome-rails"
gem 'simple_form'
gem 'simple_form-tailwind'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "faker"
  gem "factory_bot_rails"
  gem "rspec-rails", ">= 6.0.0"
  gem "shoulda-matchers", "~> 5.0"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console"
end
