source 'https://rubygems.org'

ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgres as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use jquery easing plugin for animations
gem 'jquery-easing-rails'

# Use Bootstrap for grid layout
gem 'anjlab-bootstrap-rails', '~> 3.0.0.3', :require => 'bootstrap-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'capistrano', '~> 2.15'

gem 'haml-rails'
gem 'simple_form'

# Search youtube for sweet Quad City DJ remixes 
gem 'youtube_search'

# Get recommendations about which sweet Quad City DJ remixes
gem 'recommendable'

gem 'resque'

# Search google for pictures of the people fighting the Quad City DJs
gem 'binged'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'shoulda', :require => false
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'debugger'
  gem 'pry-rails'

  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify', :require => false
  gem 'growl', :require => false
  gem 'terminal-notifier-guard', :require => false

  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-resque'
end

group :production do
  gem 'rails_serve_static_assets'
end
