# == Schema Information
#
# Table name: upvotes
#
#  id          :bigint           not null, primary key
#  upvote      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_upvotes_on_question_id  (question_id)
#  index_upvotes_on_student_id   (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (student_id => students.id)
#

class Upvote < ApplicationRecord
  belongs_to :student
  belongs_to :question
end
