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
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
Teacher.create(name: Faker::Name.name, school_id: rand(1008..1011))
puts "done with naming teachers"


puts "feelings with emoji"
Feeling.create(emoji: "😊", score: 5)
Feeling.create(emoji: "😕", score: 2)
Feeling.create(emoji: "😡", score: 0)
Feeling.create(emoji: "😭", score: 2)
Feeling.create(emoji: "🙌", score: 5)
Feeling.create(emoji: "🤔", score: 4)
Feeling.create(emoji: "😫", score: 0)
Feeling.create(emoji: "🙃", score: 3)
Feeling.create(emoji: "👍", score: 4)
Feeling.create(emoji: "👎", score: 1)
puts "done with feelings"

emojis = ["😊","😕","😡","😭","🙌","🤔","😫","🙃","👍","👎"]
descriptions = ["I love this teacher!","I'm very stressed!","This teacher has great personality and can entertain the class.","He made a hard topic so much easier.","He also provided very useful summary modules on Blackboard that you MUST learn","He gives a LOT of work back to back"]
puts "create reviews"
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
Review.create(description: descriptions.sample, rating: rand(1..5), quality: rand(1..5), easiness: rand(1..5), helpfulness: rand(1..5), feelings: emojis.sample, student_id: rand(87..88), teacher_id: rand(94..96))
puts "end of reviews"
