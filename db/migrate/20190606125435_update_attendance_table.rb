# frozen_string_literal: true

class UpdateAttendanceTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :lesson, index: true, foreign_key: true
    # remove_reference :attendances, :klass, index: true
  end
end
