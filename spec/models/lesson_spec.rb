# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
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
#  index_lessons_on_teacher_id  (teacher_id)
#

require 'rails_helper'

# RSpec.describe Lesson, type: :model do
# pending "add some examples to (or delete) #{__FILE__}"
# end
