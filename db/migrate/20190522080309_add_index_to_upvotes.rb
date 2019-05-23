# frozen_string_literal: true

class AddIndexToUpvotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :upvotes, :student, foreign_key: true
    add_reference :upvotes, :question, foreign_key: true
  end
end
