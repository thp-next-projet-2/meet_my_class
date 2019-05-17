class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :student, foreign_key: true
      t.references :klasse, foreign_key: true
      t.datetime :invited_at
      t.datetime :connect_at

      t.timestamps
    end
  end
end
