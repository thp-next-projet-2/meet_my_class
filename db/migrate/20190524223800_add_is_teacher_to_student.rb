# frozen_string_literal: true

class AddIsTeacherToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :is_teacher, :boolean, default: false, optional: true
  end
end
