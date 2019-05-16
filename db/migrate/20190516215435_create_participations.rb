class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :student, foreign_key: true
      t.references :klass, foreign_key: true

      t.timestamps
    end
  end
end
