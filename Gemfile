source 'http://rubygems.org'

# to avoid railties conflict...
gem 'i18n', '0.8.0'

gem 'rails', '3.2.22'
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'mysql2', '~> 0.3.10'
# gem 'mysql2', '~> 0.4.10'
# requested on bundle
# gem 'activerecord-mysql2-adapter'
gem 'devise'
gem 'json'
gem 'paper_trail', '~> 4.0.0.rc'
gem 'diffy'
gem 'acts_as_list', '< 0.3.0'
gem 'will_paginate'
gem 'redcarpet', '<= 2.3.0'
gem 'exception_notification', '~> 3.0.1'

# Deploy with Capistrano
 gem 'capistrano', '< 2.15.5'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'execjs', '2.0.2'
#  gem 'libv8', '3.3.10.4'
  gem 'therubyracer'
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end




