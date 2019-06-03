# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id', inverse_of: :lessons
  has_many :attendances, dependent: :destroy
  has_many :students, class_name: 'User', through: attendances
end
