# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

sleep(1)
puts "Destroying previous records"
Student.destroy_all
Teacher.destroy_all
Attendance.destroy_all
Klass.destroy_all
Progression.destroy_all
Question.destroy_all
Step.destroy_all
Upvote.destroy_all

sleep(1)
puts "Resetting sequence"
ActiveRecord::Base.connection.reset_pk_sequence!('students')
ActiveRecord::Base.connection.reset_pk_sequence!('teachers')
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')
ActiveRecord::Base.connection.reset_pk_sequence!('klasses')
ActiveRecord::Base.connection.reset_pk_sequence!('progressions')
ActiveRecord::Base.connection.reset_pk_sequence!('questions')
ActiveRecord::Base.connection.reset_pk_sequence!('steps')
ActiveRecord::Base.connection.reset_pk_sequence!('upvotes')

10.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456"
  )
end

Student.create!(
  first_name: "Hola",
  last_name: "Quetal",
  email: "holaquetal@yompail.com",
  password: "123456",
  password_confirmation: "123456"
)

p "Les élèves sont crées"

5.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "abcdef",
    password_confirmation: "abcdef"
  )
end

Teacher.create!(
  first_name: "Sensei",
  last_name: "Zaratan",
  email: "sensei@yopmail.com",
  password: "123456",
  password_confirmation: "123456"
)

p "Les prof sont crées"

5.times do
  Klass.create!(
    title: Faker::IndustrySegments.industry,
    description: Faker::Lorem.paragraphs,
    teacher: Teacher.all.sample
  )
end

p "Les cours sont crées"

60.times do
  Attendance.create!(
    status: "false",
    student: Student.all.sample,
    klass: Klass.all.sample,
  )
end

p "Les invitations sont créées"

20.times do
  Question.create!(
    description: Faker::Lorem.paragraphs,
    klass: Klass.all.sample,
    student: Student.all.sample,
  )
end

p "Les questions sont créées"

50.times do
  Upvote.create!(
    question: Question.all.sample,
    student: Student.all.sample
  )
end

p "Les votes sont crées"

30.times do
  Step.create!(
    name: Faker::IndustrySegments.sector,
    klass: Klass.all.sample,
  )
end

p "Les étapes sont créées"

60.times do
  Progression.create!(
    completed: "false",
    step: Step.all.sample,
    student: Student.all.sample
  )
end

p "Les progressions sont créées"

p "La base est au top :)"
