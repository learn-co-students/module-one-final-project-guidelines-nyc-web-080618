require "faker"
require "colorize"
require "artii"

def welcome
  a = Artii::Base.new
  puts a.asciify "Welcome"
  # puts "Welcome to our awesome game".bold
  puts Faker::GreekPhilosophers.quote.italic.green
  puts ""
  puts "Are You:".bold.blue.underline
  puts "1. New User".italic
  puts "2. Existing Adventurer".italic
  puts ""
  puts "Selection:"
end

def selections
  puts "Here Are Your Options".bold.underline
  puts "1. Show Stats".italic
  puts "2. Show Weapons".italic
  puts "3. Show Completed Quests".italic
  puts "4. Do a Quest".italic
  puts "5. Fight With Other Player".italic
  puts "6. Exit Game".italic
  puts ""
  puts ""
  puts "Your Selection, Sire?".bold.yellow
  input = gets.chomp
end

def character_creation
  puts "Please Enter Your Character Name"
  puts " "
  puts "Name:"


  input = gets.chomp
  player = Character.new_character(input)
  puts "Your name: #{player.name}"
  puts "*********************************"
  puts "PLEASE REMEMBER YOUR ID".bold.red
  puts "ID #{player.id}".green.bold
  player
end


def exec_selection(player, selection)
  if selection == "1"
    player.show_stats
  elsif selection == "2"
    puts ""
    puts "Here Are Your Weapons:".bold.blue
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
    puts Faker::GreekPhilosophers.quote.italic.green
  else
    puts  "Invalid Selection".red.bold
  end
end

def find_existing_character
  puts"Enter Your Character ID".bold
  input = gets.chomp
  if Character.all.exists?(id:input.to_i)
      Character.all.find_by(id:input.to_i)

  else
    puts"Character not exist or invalid input, please try again!!!".red
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
