require_relative '../config/environment'

puts "Welcome. What's your name?"
name = gets.chomp
puts "What is your email"
email = gets.chomp
puts "Please choose a username"
username = gets.chomp
current_user = User.create(name: name, username: username, email: email)
input = ""
while input != "exit"
  puts "What would you like to do? Type exit to exit."
  puts "1. Create a repository"
  puts "2. Read a repository (name)"
  puts "3. Update a repository"
  puts "4. Delete a repository"
  input = gets.chomp
  case input
  when "1"
    system "clear" or system "cls"
    puts "What is the name of your repository?"
    name_input = gets.chomp
    current_user.create_repo(name_input)
  when "2"
    system "clear" or system "cls"
    puts "What repository do you want to view?"
    name_input = gets.chomp
    puts Repository.find_by(name: name_input)
  when "3"
    system "clear" or system "cls"
    puts "What repository are you updating?"
    name_input = gets.chomp
    repo = Repository.find_by(name: name_input)
    puts "What would you like to rename the repo?"
    repo.update(name: gets.chomp)
    puts repo
  when "4"
    system "clear" or system "cls"
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
