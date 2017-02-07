source 'https://rubygems.org'

gem 'open_uri_redirections'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
# gem 'rack-cors'
gem 'nokogiri', '~> 1.7', '>= 1.7.0.1'
gem "active_model_serializers", github: "rails-api/active_model_serializers"
group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
