source 'https://rubygems.org'
ruby '3.1.0'

plugin 'bootboot'

gem 'foreman'
gem 'nokogiri'
gem 'bootstrap-sass'
gem 'bcrypt-ruby'
gem 'friendly_id'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'rake'
gem 'pg'
gem 'pg_search'
gem 'better_errors'
gem 'binding_of_caller'
gem 'rollbar'
gem 'paperclip'
gem 'aws-sdk'
gem 'aws-sdk-core'
gem 'aws-sdk-s3'
gem 'aws-sdk-resources'

gem 'acts_as_list'
gem "recaptcha", require: "recaptcha/rails"

group :development do
  gem 'pry-rails'
  gem 'rails_real_favicon'
end

group :test do
	gem 'selenium-webdriver'
	gem 'rspec-rails'
	gem 'capybara'
end

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'

gem 'jbuilder'

group :doc do
  gem 'sdoc', require: false
end

group :production do
	gem 'rails_12factor'
end

Plugin.send(:load_plugin, 'bootboot') if Plugin.installed?('bootboot')

if ENV['DEPENDENCIES_NEXT']
  enable_dual_booting if Plugin.installed?('bootboot')
  gem "rails", "~> 5.2.0"
  # Add any gem you want here, they will be loaded only when running
  # bundler command prefixed with `DEPENDENCIES_NEXT=1`.

else 
	gem "rails", "~> 4.2.11.3"
end
