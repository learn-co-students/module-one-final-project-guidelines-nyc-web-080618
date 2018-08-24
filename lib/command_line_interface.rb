def yes_or_no
  puts "Enter (y) for yes (n) for no:"
  gets.chomp
end

def print_list(list, attribute)
  counter = 1
  list.each do |item|
    puts "#{counter}. #{item[attribute]}"
    counter += 1
  end
end

def welcome
  puts "Welcome to In My Feelings!"
end

def student_or_teacher
  puts "Are you a student or a teacher?"
  gets.chomp.downcase
end

def gets_student_commands
  commands = ["Create a review","Find the highest rated teacher","Find the lowest rated teacher","Find the average rating of a teacher","Exit"]
  puts "What would you like to do?"
  commands.each_with_index do |command,index|
    puts "#{index+1}. #{command}"
  end
  gets.chomp
end

def gets_teacher_commands
  commands = ["Display all your reviews","Find your average rating","Find highest review","Find lowest review","Exit"]
  commands.each_with_index do |command,index|
    puts "#{index+1}. #{command}"
  end
  gets.chomp
end

def continue?(type)
  puts "Would you like to do something else?"
  user_input = yes_or_no
  if user_input == "y" && type == "s"
    gets_student_commands
  elsif user_input == "y" && type == "t"
    gets_teacher_commands
  else
    "5"
  end
end

def gets_name
  puts "What is your full name?"
  gets.chomp.downcase.titleize
end

def gets_teacher_choice(school_id)
  puts "Which teacher would you like to review?"
  teacher_list = Teacher.where(school_id: school_id)
  if teacher_list == []
    puts "There are no teachers listed for your school. What is your teacher's name?"
    gets.chomp
  else
    print_list(teacher_list,:name)
    gets.chomp.to_i
  end
end

def gets_school_name
  puts "What is the name of your school?"
  gets.chomp.downcase.titleize
end

def gets_school_location
  puts "Where is your school located?"
  gets.chomp.downcase.titleize
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

def gets_description
  puts "How else can you describe your experience with your Teacher?"
  gets.chomp
end

def gets_feeling
  puts "How do you feel? Please select an emoji."
  print_list(Feeling.all,:emoji)
  gets.chomp.to_i
end
