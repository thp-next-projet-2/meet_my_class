# frozen_string_literal: true

class CreateLessonSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_steps do |t|
      t.references :lessons, foreign_key: true
      t.references :steps, foreign_key: true

      t.timestamps
    end
  end
end
