# frozen_string_literal: true

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

FactoryBot.define do
  factory :upvote do
    student { FactoryBot.create(:user) }
    question { FactoryBot.create(:question) }
  end
end
