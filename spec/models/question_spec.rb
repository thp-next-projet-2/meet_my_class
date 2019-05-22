# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id                :bigint           not null, primary key
#  description       :text
#  questionable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  questionable_id   :bigint
#  student_id        :bigint
#
# Indexes
#
#  index_questions_on_questionable_type_and_questionable_id  (questionable_type,questionable_id)
#  index_questions_on_student_id                             (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:student) }
end
