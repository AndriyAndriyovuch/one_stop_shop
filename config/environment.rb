# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "one-stop-shop.fly.dev",
  :user_name            => ENV["GMAIL_USERNAME"],
  :password             => ENV["GMAIL_PASSWORD"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
