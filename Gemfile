source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.0.2"

gem "bcrypt", "~> 3.1.7" # Use ActiveModel has_secure_password
gem "bootsnap", ">= 1.1.0", require: false
gem "devise" # Use devise as authentication module
gem "devise-jwt", "~> 0.5.8" # Use JWT token authentication with devise
gem "graphql"
gem "graphql-errors"
gem "jbuilder", "~> 2.5"
gem "pg"
gem "puma", "~> 3.12"
gem "rack-cors"
gem "rack-cors"

group :development, :test do
  gem "awesome_print" # better console ouput for objects -> ap object.inspect
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails" # craate a .env file to set local environment variables
  gem "factory_bot_rails" # model mocks with factory bot
  gem "rspec-rails", "~> 4.0.0"
  gem "standard"
  gem "bullet"
end

group :test do
  gem "database_cleaner", "~> 1.6"
  gem "faker", "~> 1.8"
  gem "rails-controller-testing"
  gem "shoulda-matchers", "4.0.0.rc1"
  gem "simplecov", require: false
end

group :development do
  gem "annotate"
  gem "bullet"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
