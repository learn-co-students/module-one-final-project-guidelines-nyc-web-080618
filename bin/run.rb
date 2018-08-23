require_relative '../config/environment'
require 'commander/import'

def read_menu
  system "clear" or system "cls"
  puts "What info would you like"
  puts "1. Read a user"
  puts "2. Read a repository"
  puts "3. Read your repositories"
  puts "4. Read your forked repositories"
  puts "5. Read users who forked your repositories"
  puts "6. Read your starred repositories"
  puts "7. Search your repositories by programming language"
  puts "8. See your followers"
  puts "9. See users you follow"
  puts "Type 'exit' to exit"

  read_input = gets.chomp

  case read_input
  when "1"
    puts "Who are you looking for?"
    userInput = gets.chomp
    user = User.find_by(username: userInput)
    # user ? puts "#{user}" : puts "#{userInput} does not exist."
    if user then puts user.name else puts "#{userInput} does not exist." end
  when "2"
    puts " "
  when "3"
    puts " "
  when "4"
    puts " "
  when "5"
    puts " "
  when "6"
    puts " "
  when "7"
    puts " "
  when "8"
    puts " "
  when "9"
    puts " "
  when "exit"
    return
  else
    puts " "
  end
end

def main
  puts "Welcome!"

  name = ask("Name: ")

  username = ask("Username: ")

  email = ask("Email: ")

  current_user = User.create(name: name, username: username, email: email)
  speak "Hello #{name}"
  input = ""
  while input != "exit"
    puts "What would you like to do? Type exit to exit"
    puts "1. Create a repository"
    puts "2. Read a repository (name)"
    puts "3. Update a repository"
    puts "4. Delete a repository"
    input = gets.chomp
    case input
    when "1" ### CREATE
      system "clear" or system "cls"
      puts "What is the name of your repository?"
      name_input = gets.chomp
      current_user.create_repo(name_input)
    when "2" ### READ
      read_menu
      system "clear" or system "cls"
    when "3" ### UPDATE
      system "clear" or system "cls"
      puts "What repository are you updating?"
      name_input = gets.chomp
      repo = Repository.find_by(name: name_input)
      puts "What would you like to rename the repo?"
      repo.update(name: gets.chomp)
      puts repo
    when "4" ### DESTROY
      system "clear" or system "cls"
      puts "Which repository are you deleting?"
      name_input = gets.chomp
      repo = Repository.find_by(name: name_input)
      repo.destroy
      puts "Repo deleted. Trust me"
    when "exit"
      system "clear" or system "cls"
      break
    else
      puts "Not a valid choice, try again.\n"
    end
  end
end # end main

main
