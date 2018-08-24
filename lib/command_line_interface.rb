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
  puts "Welcome to Rate My Teachers!"
end

def gets_command
  commands = ["Create a review","Find the highest rated teacher","Find the lowest rated teacher","Find the average rating of a teacher","Exit"]
  puts "What would you like to do?"
  counter = 1
  commands.each do |command|
    puts "#{counter}. #{command}"
    counter += 1
  end
  gets.chomp
end

def continue?
  puts "Would you like to do something else?"
  user_input = yes_or_no
  if user_input == "y"
    gets_command
  else
    "5"
  end
end

def gets_student_name
  puts "What is your full name?"
  gets.chomp
end

def gets_teacher_name(school_id)
  puts "Which teacher would you like to review?"
  teacher_list = Teacher.where(school_id: school_id)
  print_list(teacher_list,:name)
  gets.chomp
end

def gets_school_name
  puts "What school do you attend?"
  gets.chomp
end

def gets_school_location
  puts "Where is your school located?"
  gets.chomp
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

def gets_feeling_score
  puts "How do you feel? Please select an emoji."
  print_list(Feeling.all,:emoji)
  emoji = gets.chomp
  feeling = Feeling.find_by(emoji: emoji)
  feeling.score
end
