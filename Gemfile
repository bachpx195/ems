source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.2"

# ORM
gem "mysql2", ">= 0.3.18", "< 0.5"

# Common
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "tzinfo-data"

# Frontend
gem "bootstrap-sass", "~> 3.3.6"
gem "font-awesome-rails"

# Authentication
gem "devise"

# Upload file
gem "carrierwave"
gem "mini_magick"

# Support
gem "config"

# Editor
gem "ckeditor"

# Paginate
gem "kaminari"
gem "bootstrap-kaminari-views"

# Search
gem "ransack"

# DatetimePicker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

group :development, :test do
  # Debug
  gem "byebug"
  gem "pry-rails"
  # Fake data
  gem "faker"
end

group :development do
  # Check convention
  gem "rubocop", "~> 0.40.0", require: false
  # gem "brakeman"
  # gem "bundler-audit", "~> 0.4.0"
  gem "listen", "~> 3.0.5"
  # gem "awesome_print"
  # gem "hirb"
end

group :test do
  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", "~> 4.0"
  gem "shoulda-matchers", "~> 3.0"
  gem "database_cleaner", "~> 1.5"
  gem "simplecov", require: false
end
