# frozen_string_literal: true

class MakeStudentsDeviseTrackable < ActiveRecord::Migration[5.2]
  def change
    change_table :students, bulk: true do |t|
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end
  end
end
