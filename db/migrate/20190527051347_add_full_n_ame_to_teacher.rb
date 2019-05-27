# frozen_string_literal: true

class AddFullNAmeToTeacher < ActiveRecord::Migration[5.2]
  def change
    change_table :teachers, bulk: true do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
    end
  end
end
