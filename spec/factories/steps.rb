# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klass_id   :bigint
#
# Indexes
#
#  index_steps_on_klass_id  (klass_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#

FactoryBot.define do
  factory :step do
    klass { nil }
    name { "MyString" }
  end
end
