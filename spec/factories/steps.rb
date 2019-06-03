# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  klass_id    :bigint
#
# Indexes
#
#  index_steps_on_klass_id  (klass_id)
#

FactoryBot.define do
  factory :step do
    name { "Hola" }
    description { "Quetal" }
    klass { FactoryBot.create(:klass) }

    trait :invalid_name do
      name { nil }
    end

    trait :invalid_klass do
      klass_id { nil }
    end
  end
end
