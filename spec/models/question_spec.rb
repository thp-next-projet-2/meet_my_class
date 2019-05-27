# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  klass_id    :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_questions_on_klass_id    (klass_id)
#  index_questions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:klass) }
  it { is_expected.to have_many(:upvotes) }
end
