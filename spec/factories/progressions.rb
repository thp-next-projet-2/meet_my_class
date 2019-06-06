# frozen_string_literal: true

# == Schema Information
#
# Table name: progressions
#
#  id         :bigint           not null, primary key
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  step_id    :bigint
#  student_id :bigint
#
# Indexes
#
#  index_progressions_on_step_id     (step_id)
#  index_progressions_on_student_id  (student_id)
#

FactoryBot.define do
  factory :progression do
    student { FactoryBot.create(:user) }
    step { FactoryBot.create(:step) }
    completed { false }

    trait :invalid_step do
      step_id { nil }
    end

    trait :invalid_student do
      student_id { nil }
    end
  end
end
