require "faker"
require "colorize"
require "artii"

#CLI helper methods

#display the weclome screen when the game starts
def welcome

#initial welcome message
  puts Artii::Base.new.asciify "Welcome"

#random philosophic quote
  puts Faker::GreekPhilosophers.quote.italic.green


  puts ""

  character_prompt

end

#prompt the player for character selection
def character_prompt
  puts "Are You:".bold.blue.underline
  puts "1. New User".italic
  puts "2. Existing Adventurer".italic
  puts ""
  puts "Selection:"
end

#standard selection screen w/numbered options
def selections
  puts "Here Are Your Options".bold.underline
  puts "1. Show Stats".italic
  puts "2. Show Weapons".italic
  puts "3. Show Completed Quests".italic
  puts "4. Do a Quest".italic
  puts "5. Fight Another Player".italic
  puts "6. Exit Game".italic
  puts ""
  puts ""
  puts "Your Selection, Sire?".bold.yellow
  input = gets.chomp
end

#method for creating a new character
def character_creation
  puts "Please Enter Your Character Name"
  puts " "
  puts "Name:"

#use input of desired character name to instantiate new character object
  input = gets.chomp
  player = Character.new_character(input)


  puts "Your name: #{player.name}"
  puts "*********************************"


#display object ID so player can return to game in the future
  puts "PLEASE REMEMBER YOUR ID".bold.red
  puts "ID #{player.id}".green.bold
  player   #return the new character instance
end

#method for executing a player's selection
def exec_selection(player, selection)

#player wants to see his stats
  if selection == "1"
    player.show_stats

#player want to see weapons
  elsif selection == "2"
    puts ""
    puts "Here Are Your Weapons:".bold.blue
    puts " "
    player.show_all_weapons

#player wants to see his completed quests
  elsif selection == "3"
    player.get_completed_quests

#player wants to do a quest
  elsif selection == "4"
    player.quest_interface

#player wants to fight another character
  elsif selection == "5"
    target = player.select_target
    player.attack(target)

#player chooses to exit the game
  elsif selection == "6"
    puts Faker::GreekPhilosophers.quote.italic.green

#otherwise invalid
  else
    puts  "Invalid Selection".red.bold
  end
end


#method for finding an existing character
def find_existing_character

#prompt the user for his ID
  puts"Enter Your Character ID".bold.white.on_light_blue
  input = gets.chomp

#if the character with that ID exists, pull the character instance
  if Character.all.exists?(id:input.to_i)
      Character.all.find_by(id:input.to_i)

#see if the character with ID has been destroyed by another player
  elsif
    input.to_i < Character.all.last.id
    puts "Your character has been killed!!!!".red
    puts Artii::Base.new.asciify "Sorry"

#re-prompt the user
    character_prompt

    player = player_choose
  else
    puts"This character does not exist or invalid input, please try again!!!".red

#re-prompt the user
    character_prompt

    player = player_choose
  end
end

#execute the player's selection for character choice
def player_choose
  input = gets.chomp

#if player chooses to make  a new character
  if input == "1"
    player = character_creation

#if player chooses to play as an existing character
  elsif input == "2"
    player = find_existing_character

#invalid input
  else
    puts "Invalid input. Try again.".white.on_red

#re - prompt the user
    character_prompt

    player = player_choose


  end
end
