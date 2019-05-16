class CreateQuestionables < ActiveRecord::Migration[5.2]
  def change
    create_table :questionables do |t|
      t.boolean :klass_or_step_id
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
