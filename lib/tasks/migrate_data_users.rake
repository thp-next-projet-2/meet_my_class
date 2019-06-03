# frozen_string_literal: true

# lib/tasks/temporary/migrate_data_users.rake
# https://thoughtbot.com/blog/data-migrations-in-rails
namespace :unify_users do # rubocop:disable Metrics/BlockLength
  desc "Migrate Student to User"
  task students: :environment do
    puts "Going to move #{Student.count} students"

    ActiveRecord::Base.transaction do
      Student.all.each do |s|
        user = User.new(
          email: s.email,
          password: 'legacy',
          encrypted_password: s.encrypted_password,
          first_name: s.first_name,
          last_name: s.last_name,

          ## Recoverable
          reset_password_token: s.reset_password_token,
          reset_password_sent_at: s.reset_password_sent_at,

          ## Rememberable
          remember_created_at: s.remember_created_at,

          ## Trackable
          sign_in_count: s.sign_in_count,
          current_sign_in_at: s.current_sign_in_at,
          last_sign_in_at: s.last_sign_in_at,
          current_sign_in_ip: s.current_sign_in_ip,
          last_sign_in_ip: s.current_sign_in_ip
        )
        user.save!
      end
    end

    puts " All done now!"
  end

  desc "Migrate Teacher to User"
  task teachers: :environment do
    puts "Going to move #{Teacher.count} teachers"

    ActiveRecord::Base.transaction do
      Teacher.all.each do |t|
        user = User.new(
          email: t.email,
          password: 'legacy',
          encrypted_password: t.encrypted_password,
          first_name: t.first_name,
          last_name: t.last_name
        )
        user.save!
        user.reload
        Klass.where(teacher_id: t.id).each do |k|
          k.reload
          k.teacher_id = user.reload.id
          k.save!
        end
      end
    end

    puts " All done now!"
  end
end
