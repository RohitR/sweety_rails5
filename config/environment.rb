# Load the Rails application.
require_relative 'application'
Rails.application.config.action_cable.disable_request_forgery_protection = true

# Initialize the Rails application.
Rails.application.initialize!
