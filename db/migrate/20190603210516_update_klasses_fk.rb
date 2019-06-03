# frozen_string_literal: true

class UpdateKlassesFk < ActiveRecord::Migration[5.2]
  def change
    # remove the old foreign_key
    remove_foreign_key :klasses, :teachers
    add_reference :klasses, :user, foreign_key: true
  end
end
