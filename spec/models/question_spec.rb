# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint
#
# Indexes
#
#  index_questions_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
