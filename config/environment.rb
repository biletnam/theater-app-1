# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SG_USERNAME"],
  :password => ENV["SG_PASSWORD"],
  :domain => 'floating-savannah-19980.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options = { host: 'floating-savannah-19980.herokuapp.com' }