DdsApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
#  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  #config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   :location => '/usr/sbin/sendmail',
  #   :arguments => '-i -t'
  # }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

#  config.action_mailer.delivery_method = :smtp

#  config.action_mailer.smtp_settings = {
#    :address => "mail.polarbeardesign.net",
#    :port => 2525,
#    :domain => "polarbeardesign.net",
#    :authentication => "plain",
#    :user_name => "jim@polarbeardesign.net",
#    :password => "sJ2VPx5*KG@x7wq;N",
#    :enable_starttls_auto => false
#  }


  # Add html tags and attribute to allow from sanitize function 
  config.action_view.sanitized_allowed_tags = 'table', 'tbody', 'tr', 'td', 'th', 'form', 'input'
  config.action_view.sanitized_allowed_attributes = 'id', 'class', 'style', 'colspan', 'rowspan', 'cellspacing', 'cellpadding', 'cellborder', 'align', 'nowrap', 'bgcolor', 'action', 'method', 'value', 'type'

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end

