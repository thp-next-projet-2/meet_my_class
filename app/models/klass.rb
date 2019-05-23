# frozen_string_literal: true

# == Schema Information
#
# Table name: klasses
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :bigint
#
# Indexes
#
#  index_klasses_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_id => teachers.id)
#

class Klass < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 15 }

  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances

  has_many :steps, dependent: :destroy

  belongs_to :teacher, optional: true
  has_many :questions, as: :questionable, dependent: :destroy # question polymorphism
end
