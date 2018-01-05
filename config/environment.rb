# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
#
# ActionMailer::Base.smtp_settings = {
#   :user_name => 'ochng6654@gmail.com',
#   :password => 'SamsungNote2!',
#   :domain => 'dvqm.hatchboxapp.com',
#   #:domain => 'attendance-reworked.herokuapp.com',
#   :address => 'smtp.gmail.com',
#   :port => 587,
#   :authentication => :plain,
#   :ssl => true,
#   :enable_starttls_auto => true,
#   :tls => true
# }

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'domain.com',
  #:domain => 'attendance-reworked.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 2525,
  :authentication => :plain,
  :enable_starttls_auto => true
}
