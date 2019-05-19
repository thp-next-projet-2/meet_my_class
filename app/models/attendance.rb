# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :klass
end
