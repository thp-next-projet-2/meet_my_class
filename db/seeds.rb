# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Student.create!(email: "student@one.com")
# Student.create!(email: "student@two.com")
# Student.create!(email: "student@three.com")
# sleep(1)

# sleep(1)
# s = Teacher.create!(email: 'teacher@one.com', password: 'password')
# s.klasses.create!(title: 'Class One', description: 'First class rules!')
# s.klasses.create!(title: 'Class Three', description: 'Third class, because the second one was already taken.')

# sleep(1)
# t = Teacher.create!(email: 'teacher@two.com', password: 'password')
# t.klasses.create!(title: 'Class Two', description: "That's class another class, and it's nice too.")

# Attendance.create(klass_id: 1, student_id: 1)
# Attendance.create(klass_id: 2, student_id: 1)
# Attendance.create(klass_id: 2, student_id: 2)

Student.delete_all
Teacher.delete_all
Klass.delete_all
Step.delete_all
Progression.delete_all

(1..10).to_a.each do |i|
  puts "Creating Student #{i}"
  email = Faker::Internet.email
  password = "password"
  Student.create!(email: email, password: password)

  puts "Creating Teacher #{i}"
  email = Faker::Internet.email
  password = "password"
  Teacher.create!(email: email, password: password)

  puts "Creating Klass #{i}"
  description = Faker::Lorem.paragraph
  title = Faker::Lorem.word
  teacher_id = i
  Klass.create!(description: description, title: title, teacher_id: teacher_id)

  puts "Creating Step #{i}"
  name = Faker::Name.name
  klass_id = i
  Step.create!(name: name, klass_id: klass_id)

  puts "Creating progression #{i}"
  completed = false
  step_id = i
  student_id = i
  Progression.create!(completed: completed, step_id: step_id, student_id: student_id)
end

p "Created #{Student.count} Student"
p "Created #{Teacher.count} Teacher"
p "Created #{Klass.count} klass"
p "Created #{Step.count} step"
p "Created #{Progression.count} Progression"
