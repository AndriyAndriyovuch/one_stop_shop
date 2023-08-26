# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.mailer_sender = ENV["GMAIL_USERNAME"]

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.email_regexp = /\A[a-zA-Z0-9_.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-]+\z/

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..128
  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
