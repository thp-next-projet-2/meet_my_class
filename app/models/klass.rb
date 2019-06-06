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
#  user_id     :bigint
#
# Indexes
#
#  index_klasses_on_teacher_id  (teacher_id)
#  index_klasses_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Klass < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 15 }

  belongs_to :teacher,
             class_name: 'User',
             foreign_key: 'teacher_id',
             optional: true,
             inverse_of: :given_klasses

  has_many :attendances, dependent: :destroy
  has_many :students,
           class_name: 'User',
           source: :student,
           foreign_key: 'student_id',
           through: :attendances,
           inverse_of: :klasses

  has_many :steps, dependent: :destroy
  has_many :questions, dependent: :destroy
end
