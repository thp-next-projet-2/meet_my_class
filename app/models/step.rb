# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  klass_id    :bigint
#
# Indexes
#
#  index_steps_on_klass_id  (klass_id)
#

class Step < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :name, :description, presence: true

  belongs_to :klass

  has_many :progressions, dependent: :destroy
  # has_many :students, through: :progressions

  has_many :lessons_steps, dependent: :destroy
  has_many :lessons, through: :lessons_steps
end
