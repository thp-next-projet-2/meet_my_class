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
#  user_id     :bigint
#
# Indexes
#
#  index_klasses_on_teacher_id  (teacher_id)
#  index_klasses_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :klass do
    title { Faker::Coffee }
    description { Faker::Lorem.characters(25) }
    teacher { FactoryBot.create(:teacher) }

    trait :nil_title do
      title { nil }
    end

    trait :nil_teacher do
      teacher_id { nil }
    end
  end
end
