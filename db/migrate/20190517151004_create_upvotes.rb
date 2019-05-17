class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.references :student, foreign_key: true
      t.references :question, foreign_key: true
      t.boolean :upvote

      t.timestamps
    end
  end
end
