# frozen_string_literal: true

class FixKlassesAndQuestionsFks < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :klasses, :users
    add_foreign_key :klasses, :users, column: :teacher_id
    remove_column :klasses, :user_id, :integer, default: nil

    remove_foreign_key :questions, :users
    add_foreign_key :questions, :users, column: :student_id
    remove_column :questions, :user_id, :integer, default: nil
  end
end
