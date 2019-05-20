# frozen_string_literal: true

class AddIndexToKlasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :klasses, :teacher, foreign_key: true
  end
end
