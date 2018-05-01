source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'faraday', '~> 0.14.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.2'
  gem 'bullet', '~> 5.7', '>= 5.7.5'
  gem 'debug-extras', '~> 0.4.3'
  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'pry-rails'

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
