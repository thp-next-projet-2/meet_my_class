# frozen_string_literal: true

module SessionsHelper
  def current_user_email_sign_out_link
    if teacher_signed_in?
      render inline: "<%= link_to current_teacher.email, destroy_teacher_session_path, method: :delete %>"
    elsif student_signed_in?
      render inline: "<%= link_to current_student.email, destroy_student_session_path %>"
    else
      # TODO: Sign in as student or sign up as teacher
      render inline: "<%= link_to 'not connected', new_teacher_session_path %>"
    end
  end

  def current_user_role
    if teacher_signed_in?
      "Teacher"
    elsif student_signed_in?
      "Student"
    else
      "Visitor"
    end
  end
end
