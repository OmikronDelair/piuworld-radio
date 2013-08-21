source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.0.rc1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem 'haml'
gem 'newrelic_rpm'
gem 'puma'
gem 'settingslogic'

group 'development' do
  gem 'pry'
end

group :production do
  gem 'pg'
  gem 'zurb-foundation', '~> 4.0.4'
end

group :development, :test do
  gem 'sqlite3'
  gem 'zurb-foundation', '~> 4.0.4'
end

group :assets do
  gem 'sass-rails', '~> 4.0.0.rc1'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

group :doc do
  gem 'sdoc', require: false
end
