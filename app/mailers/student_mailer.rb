# frozen_string_literal: true

class StudentMailer < ApplicationMailer
  default from: 'no-reply@themeetmyclass.com'

  # def welcome_email(student)
  #   # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
  #   @student = student

  #   # on définit une variable @url qu'on utilisera dans la view d’e-mail
  #   @url = 'https://meet-my-class-staging.herokuapp.com/'

  #   # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
  #   mail(to: @student.email, subject: 'Bienvenue chez nous !')
  # end

  def invitation_klass_mail(attendance)
    @attendance = attendance
    @klass = @attendance.klass
    @title = @attendance.klass.title
    @teacher = @attendance.klass.teacher
    mail(to: @attendance.student.email, subject: "Invitation a rejoindre une classe")
  end

  def invitation_application_mail(email, teacher)
    @teacher = teacher
    @email = email
    mail(to: @email, subject: "Invitation à devenir membre de The_meet_my_class")
  end
end
