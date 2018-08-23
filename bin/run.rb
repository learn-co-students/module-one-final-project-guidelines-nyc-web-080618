require_relative '../config/environment'
require_relative './menu'
require 'commander/import'

def main
  puts "Welcome!"
  speak ""

  name = ask("Name: ")

  username = ask("Username: ")

  email = ask("Email: ")

  current_user = User.find_by(name: "Justin")
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
      readExit = false
      while !readExit
        readExit = read_menu(current_user)
      end
      # system "clear" or system "cls"
    when "3" ### UPDATE
      update_menu(current_user)
      # system "clear" or system "cls"
    when "4" ### DESTROY
      # system "clear" or system "cls"
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
      system "clear" or system "cls"
    end
  end
end # end main

main
