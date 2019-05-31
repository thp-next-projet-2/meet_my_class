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
    name { Faker::Color.color_name }
    description { Faker::Quotes::Shakespeare.hamlet_quote }
    klass { FactoryBot.create(:klass) }

    trait :invalid_title do
      title { nil }
    end

    trait :invalid_klass do
      klass_id { nil }
    end
  end
end

