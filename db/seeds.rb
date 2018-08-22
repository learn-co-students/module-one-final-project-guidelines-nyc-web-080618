require 'pry'
require 'faker'
# require '../app/models/student.rb'

puts "naming students"
Student.create(name: Faker::HeyArnold.character, school_id: rand(1..3))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1..3))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1..3))

puts "done with naming students"


puts "naming teachers"
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1..3))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1..3))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1..3))
puts "done with naming teachers"


puts "naming school"
School.create(name: Faker::University.name, location: Faker::HeyArnold.location)
School.create(name: Faker::University.name, location: Faker::HeyArnold.location)
School.create(name: Faker::University.name, location: Faker::HeyArnold.location)
puts "done naming school"


puts "feelings with emoji"
Feeling.create(emoji: ":happy:", score: 5)
Feeling.create(emoji: ":nervous:", score: 2)
Feeling.create(emoji: ":sad:", score: 0)
Feeling.create(emoji: ":crying:", score: 2)
puts "done with feelings"
