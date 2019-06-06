# frozen_string_literal: true

class UpdateAttendanceTable < ActiveRecord::Migration[5.2]
  def change
    remove_reference :attendances, :klass, index: true
    add_reference :attendances, :lesson, index: true, foreign_key: true
  end
end
