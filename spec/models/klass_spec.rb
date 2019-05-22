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
  it "has a valid factory" do
    expect(build(:klass)).to be_valid
  end

  it { is_expected.to belong_to(:teacher) }
  it { is_expected.to have_many(:steps) }
  it { is_expected.to have_many(:questions) }
end
