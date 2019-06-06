# frozen_string_literal: true

class UpdateAttendanceTable < ActiveRecord::Migration[5.2]
  def change
    remove_index :attendances, :klass_id
    add_reference :attendances, :lesson, foreign_key: true
  end
end
