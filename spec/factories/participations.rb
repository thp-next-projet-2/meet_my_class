# == Schema Information
#
# Table name: participations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klass_id   :bigint
#  student_id :bigint
#
# Indexes
#
#  index_participations_on_klass_id    (klass_id)
#  index_participations_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :participation do
    student { nil }
    klass { nil }
  end
end
