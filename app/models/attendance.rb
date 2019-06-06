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
#  lesson_id    :bigint
#  student_id   :bigint
#
# Indexes
#
#  index_attendances_on_lesson_id   (lesson_id)
#  index_attendances_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#

class Attendance < ApplicationRecord
  after_create :invitation_to_klass

  belongs_to :student, class_name: 'User', foreign_key: 'student_id', inverse_of: :attendances
  belongs_to :klass

  def invitation_to_klass
    StudentMailer.invitation_klass_mail(self).deliver_now
  end
end
