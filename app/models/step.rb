# frozen_string_literal: true

class Step < ApplicationRecord
  belongs_to :klass

  has_many :progressions, dependent: :destroy
  has_many :students, through: :progressions
end
