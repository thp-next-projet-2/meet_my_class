# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.datetime :invited_at
      t.datetime :connected_at
      t.belongs_to :student, index: true
      t.belongs_to :klass, index: true

      t.timestamps
    end
  end
end
