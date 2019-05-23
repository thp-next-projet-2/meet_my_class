# frozen_string_literal: true

class AddQuestionableToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :questionable, polymorphic: true, index: true
    add_reference :questions, :student, foreign_key: true
  end
end
