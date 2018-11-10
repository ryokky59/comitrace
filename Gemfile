source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# DB/Model
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'

# View/Front
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'slim-rails'

# Log in
gem 'devise'

# Image/Upload
gem 'carrierwave'
gem 'mini_magick'

# Chart
gem 'chart-js-rails'
gem 'gon'

# Form
gem 'cocoon'
gem 'jquery-timepicker-rails'
gem 'bootstrap-datepicker-rails'

# Flash Message
gem 'toastr-rails'

# Pagenation
gem 'kaminari', '~> 0.17.0'

# Seach
gem 'ransack'

# Icon
gem 'font-awesome-rails'
gem 'material_icons'

# OAuth
gem 'omniauth'
gem 'omniauth-google-oauth2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'dotenv-rails'
end
