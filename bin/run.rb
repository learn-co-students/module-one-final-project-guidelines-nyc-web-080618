require_relative '../config/environment'
require_relative '../lib/command_line_interface'

student_name = get_name
student_school_name = get_school_name

##searching school##
school_search = School.find_by(name: student_school_name) #must maintain a school table
if school_search == nil
  puts "School does not exist."
  student_school_name = get_school_name
end

student = Student.where(name: student_name, school_id: school_search.id).first_or_create
##

##printing the list of teachers##
list_of_teachers = Teacher.where(school_id: school_search.id)
puts "Please select a teacher to review."
counter = 1
list_of_teachers.each do |teacher|
  puts "#{counter}. #{teacher.name}"
  counter += 1
end
###

##searches teacher by name
teacher_name = get_teacher_name

teacher_search = Teacher.find_by(name: teacher_name)
if teacher_search == nil
  puts "Teacher does not exist."
  teacher_name = get_teacher_name
end
##

  description = get_description
  feelings = gets_feeling_score.to_i
  quality = gets_quality.to_i
  easiness = gets_easiness.to_i
  helpfulness = gets_helpfulness.to_i
  rating = (quality + easiness + helpfulness + feelings)/4
  Review.create(description: description, rating: rating, quality: quality, easiness: easiness, helpfulness: helpfulness, feelings: feelings, student_id: student.id, teacher_id: teacher_search.id)


  

  # puts "Do you want to create another review, press 'y' for yes and 'n' for no"
  # user_response = gets.chomp
  #   if user_response == 'y'
  #
  #   else
  #     puts "Thanks for reviewing!"
  #   end
