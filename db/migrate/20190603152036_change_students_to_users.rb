# frozen_string_literal: true

class ChangeStudentsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :students, :users
  end
end
