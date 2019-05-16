# == Schema Information
#
# Table name: questions
#
#  id                :bigint           not null, primary key
#  description       :text
#  questionable_type :string
#  text              :string
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



RSpec.describe Question, :type => :model do
  it { is_expected.to have_db_column(:question_id).of_type(:integer) }
  it { is_expected.to have_db_column(:question_type).of_type(:string) }

  it { is_expected.to belong_to(:question) }
end
