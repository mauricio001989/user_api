source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

gem 'active_model_serializers'

# Authentication
gem 'devise'
gem 'devise_token_auth'

# API
# gem "rack-cors"
gem 'jbuilder'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem 'solid_cache'
gem 'solid_queue'
gem 'solid_cable'

# Background Jobs
gem 'sidekiq'
gem 'redis'
gem 'sidekiq-scheduler'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem 'kamal', require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'byebug'
  gem 'database_cleaner-active_record'
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'rspec-rails'
  gem 'rubocop-rails-omakase', require: false
  gem 'shoulda-matchers'
end
