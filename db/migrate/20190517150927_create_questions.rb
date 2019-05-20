# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :student, foreign_key: true
      t.string :text
      t.text :description

      t.timestamps
    end
  end
end
