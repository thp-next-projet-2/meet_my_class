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

  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id', optional: true, inverse_of: :klasses
  has_many :attendances, dependent: :destroy
  has_many :students, class_name: 'User', foreign_key: 'student_id', through: :attendances
  has_many :steps, dependent: :destroy
  has_many :questions, dependent: :destroy
end
