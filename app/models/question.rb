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
#  user_id     :bigint
#
# Indexes
#
#  index_questions_on_klass_id    (klass_id)
#  index_questions_on_student_id  (student_id)
#  index_questions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#  fk_rails_...  (user_id => users.id)
#

class Question < ApplicationRecord
  validates :description, length: { minimum: 10 }

  belongs_to :klass
  belongs_to :student, class_name: 'User', foreign_key: 'student_id', inverse_of: :questions
  has_many :upvotes, dependent: :destroy

  def count_votes
    upvotes.count
  end
end
