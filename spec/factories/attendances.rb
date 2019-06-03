# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id           :bigint           not null, primary key
#  connected_at :datetime
#  invited_at   :datetime
#  status       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  klass_id     :bigint
#  student_id   :bigint
#
# Indexes
#
#  index_attendances_on_klass_id    (klass_id)
#  index_attendances_on_student_id  (student_id)
#

FactoryBot.define do
  factory :attendance do
    invited_at { "2019-05-19 18:23:16" }
    connected_at { "2019-05-19 18:23:16" }
    created_at { "2019-05-18 18:23:16" }
    updated_at { "2019-05-18 18:35:16" }
  end

  trait :invalid_status do
    status { "true" }
  end

  trait :invalid_student do
    student_id { nil }
  end

  trait :invalid_klass do
    klass { nil }
  end
end
