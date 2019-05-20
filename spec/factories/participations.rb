# frozen_string_literal: true

# == Schema Information
#
# Table name: participations
#
#  id         :bigint           not null, primary key
#  connect_at :datetime
#  invited_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klasse_id  :bigint
#  student_id :bigint
#
# Indexes
#
#  index_participations_on_klasse_id   (klasse_id)
#  index_participations_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klasse_id => klasses.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :participation do
    student { nil }
    klasse { nil }
    invited_at { "2019-05-17 17:08:18" }
    connect_at { "2019-05-17 17:08:18" }
  end
end
