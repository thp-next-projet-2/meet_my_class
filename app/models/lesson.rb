class Lesson < ApplicationRecord
    has_many :lesson_steps, dependant: :destroy
    has_many :steps, through: :lesson_steps
    belongs_to :teacher, foreign_key: 'teacher_id', class_name: 'User'
end
