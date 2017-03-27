class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.config.site_email_punycode
  layout 'mailer'
end
