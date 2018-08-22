


def welcome
  puts "Welcome to our awesome game"
end

def selections
  puts "Here are your options"
  puts "1. Show stats"
  puts "2. Show weapons"
  puts "3. Show completed quests"
  puts "4. Do a quest"
  puts "5. Fight a monster"
  puts "6. Exit game"

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
  puts "ID #{player.id}"
  player
end

# def quest_interface(player)
#   difficulty = [1, player.power/3].max
#   if player.get_recommended_quests(difficulty).size == 0
#     puts "You have completed all recommended quests!!!"
#   else
#     puts "Here are quests we recommend for Player Attack: #{player.power}"
#     player.print_quests(difficulty)
#     puts "Select a quest number"
#     puts "Number:"
#     selection = gets.chomp.to_i
#
#     puts "You have completed: #{player.get_recommended_quests(difficulty)[selection-1].title}"
#     puts " "
#     puts "Time for your reward adventurer!!!"
#     available_weapons = player.get_available_weapons(difficulty)
#     player.quest_selection(selection, difficulty)
#     player.weapon_reward(available_weapons)
#   end



#end



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
    player.show_all_weapons
  elsif selection == "6"
    puts "bye"
  else
    puts  "Invalid selection"


  end



end
