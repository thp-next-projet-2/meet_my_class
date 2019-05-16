# == Schema Information
#
# Table name: questionables
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  klass_or_step_id :boolean
#  question_id      :bigint
#
# Indexes
#
#  index_questionables_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

require 'rails_helper'

RSpec.describe Questionable, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
