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
    klass_id { rand(1..8).to_i }
    student_id { rand(1..8).to_i }
  end
end
