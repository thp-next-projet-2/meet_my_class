# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :student
  has_many :upvotes, dependent: :destroy
  belongs_to :questionable, polymorphic: true
end
