require 'pry'
require 'faker'
# require '../app/models/student.rb'

puts "naming students"
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
Student.create(name: Faker::HeyArnold.character, school_id: rand(1008..1011))
puts "done with naming students"


puts "naming teachers"
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::GreekPhilosophers.name, school_id: rand(1008..1011))
puts "done with naming teachers"


puts "feelings with emoji"
Feeling.create(emoji: "=D", score: 5)
Feeling.create(emoji: ":-$", score: 2)
Feeling.create(emoji: ">:(", score: 0)
Feeling.create(emoji: ":'(", score: 2)
puts "done with feelings"

puts "create reviews"
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
Review.create(description: "whatever", rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: rand(1..5), student_id: rand(22..25), teacher_id: rand(22..25))
puts "end of reviews"
