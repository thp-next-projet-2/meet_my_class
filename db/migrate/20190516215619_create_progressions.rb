class CreateProgressions < ActiveRecord::Migration[5.2]
  def change
    create_table :progressions do |t|
      t.references :student, foreign_key: true
      t.references :klass, foreign_key: true
      t.references :step, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
