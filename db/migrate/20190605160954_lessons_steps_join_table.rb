# frozen_string_literal: true

class LessonsStepsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :lessons, :steps do |t|
      t.index :lesson_id
      t.index :step_id
    end
  end
end
