# frozen_string_literal: true

# == Schema Information
#
# Table name: klasses
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :bigint
#
# Indexes
#
#  index_klasses_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_id => teachers.id)
#

require 'rails_helper'

RSpec.describe Klass, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end