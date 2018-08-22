require_relative '../config/environment'

puts "Welcome. What's your name?"
current_user = User.create(name: gets.chomp)
input = ""
while input != "exit"
  puts "What would you like to do?"
  puts "1. Create a repository"
  puts "2. Read a repository (name)"
  puts "3. Update a repository"
  puts "4. Delete a repository"
  puts "5. sign out"
  puts "exit"
  input = gets.chomp
  case input
  when "1"
    puts "What is the name of your repository?"
    name_input = gets.chomp
    current_user.create_repo(name_input)
  when "2"
    puts "What repository do you want to view?"
    name_input = gets.chomp
    puts Repository.find_by(name: name_input)
  when "3"
    puts "What repository are you updating?"
    name_input = gets.chomp
    repo = Repository.find_by(name: name_input)
    puts "What would you like to rename the repo?"
    repo.update(name: gets.chomp)
    puts repo
  when "4"
    puts "Which repository are you deleting?"
    name_input = gets.chomp
    repo = Repository.find_by(name: name_input)
    repo.destroy
    puts "Repo deleted. Trust me"
  when "exit"
    break
  else
    puts "Not a valid choice, try again.\n"
  end
end


puts "HELLO WORLD"
