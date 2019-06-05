# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
ActionMailer::Base.perform_deliveries = false

# Create 2 teachers with 2 klasses each
2.times do |i|
  teacher = User.create!(
    email: "teacher#{i + 1}@yopmail.com",
    password: 'password'
  )
  2.times do
    Klass.create!(
      title: Faker::Music::RockBand.name,
      description: Faker::Quote.yoda,
      teacher: teacher
    )
  end
end

# Create 2 users with a klass and attendances
2.times do |i|
  user = User.create!(
    email: "user#{i + 1}@yopmail.com",
    password: 'password'
  )
  Klass.create!(
    title: Faker::Music::RockBand.name,
    description: Faker::Quote.yoda,
    teacher: user
  )
  Attendance.create!(
    student: user,
    klass_id: Random.rand(1..4)
  )
end

# Create 10 students attending from 1 to 4 klasses
10.times do |i|
  student = User.create!(
    email: "student#{i + 1}@yopmail.com",
    password: 'password'
  )
  Random.rand(1..3) do
    Attendance.create!(
      student: student,
      klass_id: Faker::Number.unique.within(1..6)
    )
  end
end

# Create 3 steps per class
Klass.all.each do |klass|
  3.times do
    Step.create!(
      klass_id: klass.id,
      name: Faker::Music::RockBand.name,
      description: Faker::Quote.yoda
    )
  end
end
