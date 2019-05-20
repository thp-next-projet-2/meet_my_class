# frozen_string_literal: true

class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.boolean :upvote

      t.timestamps
    end
  end
end
