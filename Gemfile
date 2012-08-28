source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'pg', :group => :production

# Plugins etc
gem 'maruku'
gem 'dalli'
gem 'memcachier', :group => :production
gem "recaptcha", :require => "recaptcha/rails"

# Asset template engines
gem 'sass'
gem 'therubyracer-heroku', '~>0.8.0', :group => :production
gem 'coffee-script'
gem 'uglifier', '~>0.5.0'

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem "sqlite3-ruby", :require => "sqlite3"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
