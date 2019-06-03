# frozen_string_literal: true

class MoveTeacherDataToUser < ActiveRecord::Migration[5.2]
  def change
    Teacher.find_each do |teacher|
      user = User.new(
        first_name: teacher.first_name,
        last_name: teacher.last_name,
        email: teacher.email,
        encrypted_password: teacher.encrypted_password,
        reset_password_token: teacher.reset_password_token,
        reset_password_sent_at: datetime,
        remember_created_at: teacher.remember_created_at,
        created_at: teacher.created_at,
        updated_at: teacher.updated_at,
        sign_in_count: teacher.sign_in_count,
        current_sign_in_at: teacher.current_sign_in_at,
        last_sign_in_at: teacher.last_sign_in_at,
        current_sign_in_ip: teacher.current_sign_in_ip,
        last_sign_in_ip: teacher.last_sign_in_ip
      )
      user.save!
    end
  end
end
