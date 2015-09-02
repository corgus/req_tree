source 'https://rubygems.org'

ruby '2.2.1'
RAILS_VERSION = '~> 4.2.1'
gem 'rails',            RAILS_VERSION
gem 'activesupport',    RAILS_VERSION, require: 'active_support'
gem 'actionpack',       RAILS_VERSION, require: 'action_pack'
gem 'pg', '~> 0.18.2'
gem 'puma', '~> 2.13.4'

gem 'sass-rails', '~> 5.0'
# gem 'compass-rails', '~> 2.0.4'
gem 'will_paginate',    '3.0.7'
gem 'will_paginate-bootstrap'
gem 'simple_form'
gem 'enumerize'

gem 'elasticsearch-persistence'
gem 'elasticsearch-rails'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

# Authentication
gem 'devise', '~> 3.5.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'closure_tree'

group :development, :test do
  gem 'pry-rails', '~> 0.3.3'
  gem 'byebug', '~> 6.0.2'
  gem 'spring'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development do
  gem 'growl'
  gem 'ruby_gntp'
  gem 'xray-rails'
  gem 'guard-rails'
  gem 'guard-bundler',  require: false
  gem 'guard-rspec',    require: false
end

group :test do
  gem 'guard-minitest',     '2.3.1'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end
