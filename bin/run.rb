require_relative '../config/environment'

def get_name
  puts "Hey, What is your full name?"
  user_name = gets.chomp
end

def get_teacher_name
  puts "Great! Who is your teacher?"
  user_teacher = gets.chomp
end

def get_school_name
  puts "What school do you attend?"
  user_school = gets.chomp
end

student_name = get_name
student_school_name = get_school_name

school_search = School.find_by(name: student_school_name) #must maintain a school table
if school_search == nil
  puts "School does not exist."
  student_school_name = get_school_name
end
Student.where(name: student_name, school_id: school_search.id).first_or_create

teacher_name = get_teacher_name
teacher_search = Teacher.find_by(name: teacher_name)
if teacher_search == nil
  puts "Teacher does not exist."
  teacher_name = get_teacher_name
end
