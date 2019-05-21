# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_students_on_confirmation_token    (confirmation_token) UNIQUE
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :student do
    email { Faker::Internet.unique.email }
    after(:create) do |student|
      klass = create(:klass)

      create_list(:attendance, Random.rand(1..5), student: student, klass: klass)
    end

    trait :waiting_confirmation do
      password { "" }
      confirmation_sent_at { Faker::Date.backward(14) }
      confirmation_token { Faker::Internet.password(20) }
      confirmed_at { nil }
    end

    trait :confirmed do
      password { Faker::Internet.password(8, 16) }
      confirmation_sent_at { Faker::Date.between(14.days.ago, 3.days.ago) }
      confirmation_token { Faker::Internet.password(20) }
      confirmed_at { Faker::Date.between(2.days.ago, Time.zone.today) }
    end
  end
end
