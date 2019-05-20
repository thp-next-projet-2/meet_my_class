# frozen_string_literal: true

class CreateProgressions < ActiveRecord::Migration[5.2]
  def change
    create_table :progressions do |t|
      t.boolean :completed
      t.belongs_to :step, index: true
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
