# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
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
#  index_lessons_on_teacher_id  (teacher_id)
#

class Lesson < ApplicationRecord
  has_many :lessons_steps, dependent: :destroy
  has_many :steps, through: :lessons_steps
  belongs_to :teacher, foreign_key: 'teacher_id', class_name: 'User', inverse_of: lessons
end
