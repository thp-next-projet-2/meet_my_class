# frozen_string_literal: true

class AddReferenceToUpvotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :upvotes, :question, foreing_key: true
    add_reference :upvotes, :student, foreing_key: true
  end
end
