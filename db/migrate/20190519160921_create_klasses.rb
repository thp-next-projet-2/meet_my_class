# frozen_string_literal: true

class CreateKlasses < ActiveRecord::Migration[5.2]
  def change
    create_table :klasses do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
