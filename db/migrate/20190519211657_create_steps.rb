class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name
      t.belongs_to :klass, index: true

      t.timestamps
    end
  end
end
