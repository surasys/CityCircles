# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# Fix Rubygems 1.3.6 with Rails 2.3.5
# See https://rails.lighthouseapp.com/projects/8994/tickets/4026-rubygems-136-warning-in-rails-235
if Gem::VERSION >= "1.3.6"
    module Rails
        class GemDependency
            def requirement
                r = super
                (r == Gem::Requirement.default) ? nil : r
            end
        end
    end
end

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  config.gem "random_data"
  config.gem "haml"
  config.gem "authlogic"
  config.gem "geokit"
  config.gem "grackle"
  config.gem "thoughtbot-paperclip", :lib => "paperclip", :source => "http://gems.github.com"
  config.gem "ambethia-recaptcha", :lib => "recaptcha/rails", :source => "http://gems.github.com"
  config.gem 'typus', :source => 'http://gemmcutter.org'
  config.gem 'kete-tiny_mce', :lib => 'tiny_mce', :source => 'http://gems.github.com'
  config.gem "grackle"
  config.gem "calendar_date_select"
  config.gem "feedtools", :lib => "feed_tools"
  config.gem "will_paginate"
  config.gem "feed-normalizer"
  
  
  
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
  
  config.action_controller.session_store = :active_record_store
  
  ENV['RECAPTCHA_PUBLIC_KEY']  = '6LcZfQgAAAAAAGOII0ryh_w5BOjq7GK4Td7Y2Y3R'
  ENV['RECAPTCHA_PRIVATE_KEY'] = '6LcZfQgAAAAAACIo0Q5yt79bY7o6XNFtpMzz4WLQ'
  
end

# Fix sloppy Rails error handling code in form helpers.
ActionView::Base.field_error_proc = Proc.new { |html_tag, instance|
"<span class=\"fieldWithErrors\">#{html_tag}</span>" }
