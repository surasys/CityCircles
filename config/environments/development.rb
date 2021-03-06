# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# Footnotes
config.gem "josevalim-rails-footnotes", :lib => "rails-footnotes", :source => "http://gems.github.com"

ENV['RECAPTCHA_PUBLIC_KEY']  = '6LcZfQgAAAAAAGOII0ryh_w5BOjq7GK4Td7Y2Y3R'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LcZfQgAAAAAACIo0Q5yt79bY7o6XNFtpMzz4WLQ'
