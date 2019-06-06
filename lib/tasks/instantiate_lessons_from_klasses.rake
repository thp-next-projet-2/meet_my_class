# frozen_string_literal: true

namespace :instantiate_lessons do
  desc "Migrate Klass to Lesson"

  def log(msg)
    puts msg
    Rails.logger.info(msg)
  end

  task lessons: :environment do
    log "Going to move #{Klass.count} klasses"

    ActiveRecord::Base.transaction do
      Klass.all.each do |k|
        lesson = Lesson.new(
          title: k.title,
          teacher_id: k.teacher_id,
          description: k.description,
          created_at: k.created_at,
          updated_at: k.updated_at,
        )
        lesson.save!
      end
    end

    log " All done now!"
  end
end
