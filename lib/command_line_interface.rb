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
  puts "

 /$$$$$$                 /$$      /$$                 /$$$$$$$$                  /$$ /$$
|_  $$_/                | $$$    /$$$                | $$_____/                 | $$|__/
  | $$   /$$$$$$$       | $$$$  /$$$$ /$$   /$$      | $$     /$$$$$$   /$$$$$$ | $$ /$$ /$$$$$$$   /$$$$$$   /$$$$$$$
  | $$  | $$__  $$      | $$ $$/$$ $$| $$  | $$      | $$$$$ /$$__  $$ /$$__  $$| $$| $$| $$__  $$ /$$__  $$ /$$_____/
  | $$  | $$  \  $$      | $$  $$$| $$| $$  | $$      | $$__/| $$$$$$$$| $$$$$$$$| $$| $$| $$  \ $$| $$  \ $$|  $$$$$$
  | $$  | $$  | $$      | $$\  $  | $$| $$  | $$      | $$   | $$_____/| $$_____/| $$| $$| $$  | $$| $$  | $$ \____  $$
 /$$$$$$| $$  | $$      | $$ \/   | $$|  $$$$$$$      | $$   |  $$$$$$$|  $$$$$$$| $$| $$| $$  | $$|  $$$$$$$ /$$$$$$$/
|______/|__/  |__/      |__/     |__/ \____   $$      |__/    \_______/ \_______/|__/|__/|__/  |__/ \___ _   $$|_______/
                                      /$$  | $$                                                    /$$  \ $$
                                     |  $$$$$$/                                                   |  $$$$$$/
                                      \______/                                                     \______/
"

puts $pastel.red("Welcome to In My Feelings! A way for students to share their feelings of their teachers!")
end

def student_or_teacher
  puts $pastel.red("Are you a student or a teacher?")
  gets.chomp.downcase
end

def gets_student_commands
  commands = ["Create a review","Find the highest rated teacher","Find the lowest rated teacher","Find the average rating of a teacher","Exit"]
  puts $pastel.red("What would you like to do?")
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
  puts $pastel.red("Would you like to do something else?")
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
  puts $pastel.red("What is your full name?")
  gets.chomp.downcase.titleize
end

def gets_teacher_choice(school_id)
  puts $pastel.red("Which teacher would you like to review?")
  teacher_list = Teacher.where(school_id: school_id)
  if teacher_list == []
    puts $pastel.red("There are no teachers listed for your school. What is your teacher's name?")
    gets.chomp
  else
    print_list(teacher_list,:name)
    gets.chomp.to_i
  end
end

def gets_school_name
  puts $pastel.red("What is the name of your school?")
  gets.chomp.downcase.titleize
end

def gets_school_location
  puts $pastel.red("Where is your school located?")
  gets.chomp.downcase.titleize
end

def gets_quality
  puts $pastel.red("On a scale of 1-5, how would you rate the quality of this teacher?")
  gets.chomp
end

def gets_easiness
  puts $pastel.red("On a scale of 1-5, how would you rate the easiness of this teacher?")
  gets.chomp
end

def gets_helpfulness
  puts $pastel.red("On a scale of 1-5, how would you rate the helpfulness of this teacher?")
  gets.chomp
end

def gets_description
  puts $pastel.red("How else can you describe your experience with your Teacher?")
  gets.chomp
end

def gets_feeling
  puts $pastel.red("How do you feel? Please select an emoji.")
  print_list(Feeling.all,:emoji)
  gets.chomp.to_i
end
