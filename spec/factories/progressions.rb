# == Schema Information
#
# Table name: progressions
#
#  id         :bigint           not null, primary key
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klass_id   :bigint
#  step_id    :bigint
#  student_id :bigint
#
# Indexes
#
#  index_progressions_on_klass_id    (klass_id)
#  index_progressions_on_step_id     (step_id)
#  index_progressions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#  fk_rails_...  (step_id => steps.id)
#  fk_rails_...  (student_id => students.id)
#

FactoryBot.define do
  factory :progression do
    student { nil }
    klass { nil }
    step { nil }
    completed { false }
  end
end
