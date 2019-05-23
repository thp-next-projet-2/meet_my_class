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

# t = Teacher.create!(email: 'teacher@one.com', password: 'password')
# t.klasses.create!(title: 'Class One', description: 'First class rules!')

# t = Teacher.create!(email: 'teacher@two.com', password: 'password')
# t.klasses.create!(title: 'Class Two', description: "That's class another class, and it's nice too")

# Attendance.create(klass_id: 1, student_id: 1)
# Attendance.create(klass_id: 2, student_id: 2)
Student.destroy_all
Teacher.destroy_all
Klass.destroy_all

(1..10).to_a.each do |i|
  puts "Creating Student #{i}"
  email = Faker::Internet.email
  password_s = "password"
  Student.create!(email: email, password: password_s)

  puts "Creating Teacher #{i}"
  email = Faker::Internet.email
  password_t = "password"
  Teacher.create!(email: email, password: password_t)

  puts "Creating Klass #{i}"
  description = Faker::Lorem.paragraph
  title = Faker::Lorem.sentence
  teacher_id = i
  Klass.create!(description: description, title: title, teacher_id: teacher_id)
end

p "Created #{Student.count} User"
p "Created #{Teacher.count} Teacher"
p "Created #{Klass.count} Klass"
