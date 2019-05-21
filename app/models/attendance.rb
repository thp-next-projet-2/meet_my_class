# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id           :bigint           not null, primary key
#  connected_at :datetime
#  invited_at   :datetime
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

class Attendance < ApplicationRecord
  belongs_to :studentn, optional: true
  belongs_to :klass
end
