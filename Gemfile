source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core ====================================================
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'pg'

# DB / Model ==============================================
gem 'acts_as_list', '~> 0.7.6'
gem 'devise', '~> 4.2.0'

# Asset pipeline ==========================================
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


# Views ====================================================
gem 'bootstrap', '~> 4.0.0.alpha3.1'
gem 'autoprefixer-rails', '~> 6.3.7'
gem 'will_paginate', '~> 3.1.0'
gem 'slim', '~> 3.0.7'
gem 'htmlentities', '~> 4.3.4'
gem "font-awesome-rails"

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test, :development do
  gem 'byebug', platform: :mri
  gem 'rubocop', require: false
  gem 'bullet'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'email_spec'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'temping'
end
