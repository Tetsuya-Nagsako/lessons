source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 5.2.4', '>= 5.2.4.4'
gem 'mysql2', '>= 0.4.4', '< 0.6.0', group: :development
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'devise-bootstrap-views', '~> 1.0'

gem "devise"
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n', '~> 5.1'

gem 'stripe'
gem 'bcrypt'

gem 'ransack'

gem "slim-rails"
gem 'html2slim'

gem 'carrierwave'
gem 'fog-aws'

gem 'dotenv-rails'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  gem "pry-doc"
  gem "pry-byebug"
  gem "pry-stack_explorer"
  gem "rspec-rails"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'factory_bot_rails'
end

group :production, :staging do
  gem 'unicorn'
end
