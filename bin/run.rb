require_relative '../config/environment'
require 'commander/import'

def read_menu(current_user)
  # system "clear" or system "cls"
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
end # end create_menu

def create_menu(current_user)
  # system "clear" or system "cls"

  puts "What are we doing today? Exit to exit"
  puts "1. Create Repository"
  puts "2. Fork Repository"
  puts "3. Star Repository"
  puts "4. Follow User"
  create_input = gets.chomp

  case create_input
  when "1"
    puts "Repository name: "
    current_user.create_repo(gets.chomp)
  when "2"
    found = false
    while !found
      puts "Repository name: "
      create_name_input = gets.chomp
      repo = Repository.find_by(name: create_name_input)
      if repo
        current_user.fork_repo(repo)
        found = true
      else
        puts "Repository not found."
      end
    end
  when "3"
    found = false
    while !found
      puts "Which repository would you like to star?"
      repo = Repository.find_by(name: gets.chomp)
      if repo
         current_user.star_repo(repo)
         found = true
      else
        puts "Repository not found."
      end
    end
  when "4"
    found = false
    while !found
      puts "Which user would you like to follow? Please enter a username"
      user = User.find_by(username: gets.chomp)
      if user
        current_user.follow_user(user.username)
        found = true
      else
        puts "Username not found."
      end
    end
  when "exit"
    return
  else
    puts "Please enter a valid choice."
  end
end # end create_menu

def update_menu(current_user)
  # system "clear" or system "cls"

  puts "What are we updating today? Exit to exit"
  puts "1. User"
  puts "2. Repository"
  update_input = gets.chomp

  case update_input
  when "1"
    puts "What attribute would you like to update?"
    puts "1. Name"
    puts "2. Username"
    puts "3. Email"
    attribute_input = gets.chomp
    case attribute_input
    when "1"
      name = ask("Name: ")
      current_user.update(name: name)
    when "2"
      username = ask("Username: ")
      current_user.update(username: username)
    when "3"
      email = ask("Email: ")
      current_user.update(email: email)
    else
      "Not a valid attribute"
    end
  when "2"
    puts "What repository are you looking to change"
    repo_name = gets.chomp
    repo = Repository.find_by(name: repo_name)
    if repo
      puts "What would you like to rename it?"
      new_name = gets.chomp
      repo.update(name: new_name)
    else
      puts "Repo does not exist"
    end
  when "exit"
    return
  else
    puts "Invalid choice."
  end
end # end update_menu

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
    puts "1. Create"
    puts "2. Read"
    puts "3. Update"
    puts "4. Delete"
    input = gets.chomp
    case input
    when "1" ### CREATE
      create_menu(current_user)
      # system "clear" or system "cls"
    when "2" ### READ
      read_menu(current_user)
      # system "clear" or system "cls"
    when "3" ### UPDATE
      update_menu(current_user)
      # system "clear" or system "cls"
    when "4" ### DESTROY
      system "clear" or system "cls"
      puts "Which repository are you deleting?"
      name_input = gets.chomp
      repo = Repository.find_by(name: name_input)
      repo.destroy
      puts "Repo deleted. Trust me"
    when "exit"
      # system "clear" or system "cls"
      break
    else
      puts "Not a valid choice, try again.\n"
    end
  end
end # end main

main
