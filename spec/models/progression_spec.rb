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

require 'rails_helper'

RSpec.describe Progression, type: :model do
  it { is_expected.to belong_to(:step) }
  it { is_expected.to belong_to(:student) }
end
