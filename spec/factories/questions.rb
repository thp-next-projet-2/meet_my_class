# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  klass_id    :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_questions_on_klass_id    (klass_id)
#  index_questions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :question do
    description { "MyTextIsTHeTextEverSeen" }
    student { FactoryBot.create(:student) }
    klass { FactoryBot.create(:klass) }

    trait :invalid_student do
      student_id { nil }
    end

    trait :invalid_klass do
      klass_id { nil }
    end
  end
end
