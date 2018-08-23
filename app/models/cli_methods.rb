require "faker"


def welcome
  puts "Welcome to our awesome game"
  puts Faker::GreekPhilosophers.quote
  puts ""
  puts "Are your a:"
  puts "1.New User"
  puts "2.Existing adventurer"
end

def selections
  puts "Here are your options"
  puts "1. Show stats"
  puts "2. Show weapons"
  puts "3. Show completed quests"
  puts "4. Do a quest"
  puts "5. Fight with other Player"
  puts "6. Exit game"
  puts ""
  puts ""
  puts "Your selection, sire?"
  input = gets.chomp
end

def character_creation
  puts "Please enter your character name"
  puts "name"
  puts " "

  input = gets.chomp
  player = Character.new_character(input)
  puts "Your name: #{player.name}"
  puts "Current health: #{player.hp}"
  puts "Current power: #{player.power}"
  puts "************************"
  puts "please remember your ID"
  puts "ID #{player.id}"
  puts "************************"
  player
end


def exec_selection(player, selection)
  if selection == "1"
    player.show_stats
  elsif selection == "2"
    puts "Here are your weapons:"
    puts " "
    player.show_all_weapons
  elsif selection == "3"
    player.get_completed_quests
  elsif selection == "4"
    player.quest_interface
  elsif selection == "5"
    target = player.select_target
    player.attack(target)
  elsif selection == "6"
    puts Faker::GreekPhilosophers.quote
  else
    puts  "Invalid selection"
  end
end

def find_existing_character
  puts"Enter your character ID"
  input = gets.chomp
  if Character.all.exists?(id:input.to_i)
      Character.all.find_by(id:input.to_i)

  else
    puts"Character not exist or invalide input, please try again!!!"
    find_existing_character
  end
end

def player_choose
  input = gets.chomp
  if input == "1"
    player = character_creation
  else
    player = find_existing_character
  end
end
