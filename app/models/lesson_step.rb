# frozen_string_literal: true

class LessonStep < ApplicationRecord
  belongs_to :lessons
  belongs_to :steps
end
