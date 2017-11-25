# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Core ====================================================
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.2'

# DB / Model ==============================================
gem 'acts_as_list', '~> 0.7.6'
gem 'devise', '~> 4.3.0'

# Asset pipeline ==========================================
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Views ====================================================
gem 'autoprefixer-rails', '~> 7.1.1'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'htmlentities', '~> 4.3.4'
gem 'slim', '~> 3.0.7'
gem 'font-awesome-rails'
gem 'kaminari'


group :development do
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test, :development do
  gem 'bullet'
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'email_spec'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'temping'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
