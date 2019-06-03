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

2.times do |i|
  teacher = Teacher.create!(
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

Klass.all.each do |klass|
  3.times do
    Step.create!(
      klass_id: klass.id,
      name: Faker::RockBand.name
    )
  end
end

10.times do |i|
  student = Student.create!(
    email: "student#{i + 1}@yopmail.com",
    password: 'password'
  )
  Attendance.create!(
    student: student,
    klass_id: Random.rand(1..4)
  )
end
