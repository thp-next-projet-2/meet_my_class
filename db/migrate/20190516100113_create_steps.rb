class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :klasse, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
