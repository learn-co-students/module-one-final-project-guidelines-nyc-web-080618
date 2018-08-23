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
