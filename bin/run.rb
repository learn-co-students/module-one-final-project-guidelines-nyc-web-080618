require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

#gets student name, if student does not exist, create student
student_name = gets_student_name
student = Student.find_by(name: student_name)
while student == nil
  puts "We do not recognize you. Would you like to register?"
  user_input = yes_or_no
  if user_input == "y"
    student = Student.create(name: student_name)
  else
    student_name = gets_student_name
    student = Student.find_by(name: student_name)
  end
end


  #gets school, if school does not exist, asks for location to create new school
  school_name = gets_school_name
  school = School.find_by(name: school_name)
  while school == nil
    puts "We do not recognize this school. Would you like to add?"
    user_input = yes_or_no
    if user_input == "y"
      school_location = gets_school_location
      school = School.create(name: school_name,location: school_location)
    else
      school_name = gets_school_name
      school = School.find_by(name: school_name)
    end
  end

##add school_id to student object if student was just created
if student.school_id == nil || student.school_id != school.id
  student.update(school_id: school.id)
end

welcome
user_input = gets_command
while user_input != "4"
  case user_input
  when "1"
    student.create_review
    user_input = gets_command
  when "2"
    school.highest_rated_teacher
    user_input = gets_command
  when "3"
    school.lowest_rated_teacher
    user_input = gets_command
  when "4"
    puts "average rating for specific teacher"
  when "5"
    break
  end
end
