class CreateKlasses < ActiveRecord::Migration[5.2]
  def change
    create_table :klasses do |t|
      t.references :teacher, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
