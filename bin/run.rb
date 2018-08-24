require_relative '../config/environment'
require_relative './menu'
require 'commander/import'
require 'tty-prompt'

def main
  prompt = TTY::Prompt.new
  puts "Welcome!"
  speak ""

  username = ask("Username: ")

  current_user = nil

  if User.find_by(username: username)
    current_user = User.find_by(username: username)
    puts "Welcome back #{current_user.username}"
  else
    puts "We don't know you yet, give us some information about yourself."
    username = ask("Username: ")
    name = ask("Name: ")
    email = ask("Email: ")
    current_user = User.create(name: name, username: username, email: email)
    puts "Nice to meet you, #{current_user.name}."
  end

  speak "Hello #{name}"
  input = ""
  while input != "Exit"
    choices = [
      'Create',
      'Read',
      'Update',
      'Delete',
      'Exit'
    ]
    input = prompt.select('What are we doing today?', choices, cycle: true, per_page: 10)
    case input
    when "Create" ### CREATE
      create_menu(current_user)
      # system "clear" or system "cls"
    when "Read" ### READ
      readExit = false
      while !readExit
        readExit = read_menu(current_user)
      end
      # system "clear" or system "cls"

    when "Update" ### UPDATE
      update_menu(current_user)
      # system "clear" or system "cls"
    when "Delete" ### DESTROY
      # system "clear" or system "cls"
      delete_menu(current_user)
    when "Exit"
      # system "clear" or system "cls"
      break
    else
      puts "Not a valid choice, try again.\n"
      system "clear" or system "cls"
    end
  end
end # end main

main
