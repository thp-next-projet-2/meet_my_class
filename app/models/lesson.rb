# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :lessons_steps, dependent: :destroy
  has_many :steps, through: :lessons_steps
  belongs_to :teacher, foreign_key: 'teacher_id', class_name: 'User', inverse_of: lessons
end
