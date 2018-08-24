require_relative '../config/environment'
require_relative './menu'

def main
  prompt = TTY::Prompt.new
  a = Artii::Base.new
  puts a.asciify('Welcome to FlatHub!').light_white.on_black
  speak "Knock Knock"
  sleep(2)
  speak "Who's there?"
  sleep(2)
  speak "Cow says"
  sleep(2)
  speak "Cow says who?"
  sleep(2)
  speak "No a cow says mooooooooooooooooooooooooooooo"

  username = prompt.ask("Username: ", required: true)

  current_user = nil

  if User.find_by(username: username)
    current_user = User.find_by(username: username)
    puts a.asciify("Welcome back #{current_user.name}").light_white.on_black
  else
    puts "We don't know you yet, give us some information about yourself."
    username = prompt.ask("Username: ", required: true)
    name = prompt.ask("Name: ", required: true)
    email = prompt.ask("Email: ", required: true) { |q| q.validate :email }
    current_user = User.create(name: name, username: username, email: email)
    puts a.asciify("Nice to meet you, #{current_user.name}.").light_white.on_black
  end

  speak "Hello #{current_user.name}"
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
