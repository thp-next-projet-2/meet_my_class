# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.create!(email: "student@one.com")
Student.create!(email: "student@two.com")
Student.create!(email: "student@three.com")

t = Teacher.create!(email: 'teacher@one.com', password: 'password')
t.klasses.create!(title: 'Class One', description: 'First class')
t.klasses.create!(title: 'Class Two', description: "That's class two")

Attendance.create(klass_id: 1, student_id: 1)
Attendance.create(klass_id: 2, student_id: 2)
