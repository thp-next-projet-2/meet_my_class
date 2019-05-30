# frozen_string_literal: true

class AddDescriptionToStep < ActiveRecord::Migration[5.2]
  def change
    change_table :steps, bulk: true do |t|
      t.string :description
    end
  end
end
