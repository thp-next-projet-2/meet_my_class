# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@themeetmyclass.com'
  layout 'mailer'
end
