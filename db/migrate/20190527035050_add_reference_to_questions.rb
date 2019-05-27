# frozen_string_literal: true

class AddReferenceToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :klass, foreign_key: true
    add_reference :questions, :student, foreign_key: true
  end
end
