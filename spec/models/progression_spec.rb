# frozen_string_literal: true

# == Schema Information
#
# Table name: progressions
#
#  id         :bigint           not null, primary key
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klasse_id  :bigint
#  step_id    :bigint
#  student_id :bigint
#
# Indexes
#
#  index_progressions_on_klasse_id   (klasse_id)
#  index_progressions_on_step_id     (step_id)
#  index_progressions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klasse_id => klasses.id)
#  fk_rails_...  (step_id => steps.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe Progression, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
