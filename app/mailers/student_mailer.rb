# frozen_string_literal: true

class StudentMailer < ApplicationMailer
  default from: 'no-reply@themeetmyclass.com'

  def invitation_klass_mail(attendance)
    @attendance = attendance
    @klass = @attendance.klass
    @title = @attendance.klass.title
    mail(to: @attendance.student.email, subject: "Invitation a rejoindre une classe")
  end

  def invitation_application_mail(email, teacher)
    @teacher = teacher
    @email = email
    mail(to: @email, subject: "Invitation à devenir membre de The_meet_my_class")
  end
end
