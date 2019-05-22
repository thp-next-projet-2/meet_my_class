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

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:klass) }
end
