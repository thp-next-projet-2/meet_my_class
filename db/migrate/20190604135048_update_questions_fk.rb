# frozen_string_literal: true

class UpdateQuestionsFk < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :questions, :students
    add_reference :questions, :user, foreign_key: true
  end
end
