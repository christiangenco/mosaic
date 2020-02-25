source 'https://rubygems.org'

ruby '2.6.3'
gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem "font-awesome-rails"
gem 'bootstrap_form'
gem 'redcarpet'
gem 'cloudinary'
gem 'uglifier', '>= 1.3.0'
# gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'acts_as_votable', '~> 0.10.0'
gem 'acts-as-taggable-on', :git => 'https://github.com/mbleigh/acts-as-taggable-on'
gem 'devise'

gem 'pg'
gem 'redis'
# gem 'sendgrid'

# https://github.com/mbleigh/acts-as-taggable-on
# gem 'acts-as-taggable-on', '~> 3.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'binding_of_caller'
  gem 'rubocop'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'foreman'
  # gem 'quiet_assets'
  gem 'rails_apps_pages'
  gem 'rails_layout'
  gem 'dotenv-rails'

  # testing
  gem 'guard'
  gem 'guard-minitest'
end

group :production do
  gem 'rails_12factor'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
end

