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

def gets_quality
  puts "On a scale of 1-5, how would you rate the quality of this teacher?"
  gets.chomp
end

def gets_easiness
  puts "On a scale of 1-5, how would you rate the easiness of this teacher?"
  gets.chomp
end

def gets_helpfulness
  puts "On a scale of 1-5, how would you rate the helpfulness of this teacher?"
  gets.chomp
end

def get_description
  puts "How else can you describe your experience with your Teacher?"
  gets.chomp
end


def gets_feeling_score
  puts "How do you feel? Please select an emoji."
  list_of_feelings = Feeling.all
  counter = 1
  list_of_feelings.each do |feeling|
    puts "#{counter}. #{feeling.emoji}"
    counter += 1
  end
  emoji = gets.chomp
  feeling = Feeling.find_by(emoji: emoji)
  feeling.score
end

# def create_review
#   description = get_description
#   feelings = gets_feeling_score.to_i
#   quality = gets_quality.to_i
#   easiness = gets_easiness.to_i
#   helpfulness = gets_helpfulness.to_i
#   rating = (quality + easiness + helpfulness + feelings)/4
#   Review.create(description: description, rating: rating, quality: quality, easiness: easiness, helpfulness: helpfulness, feelings: feelings, student_id: student.id, teacher_id: teacher_search.id)
# end


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
