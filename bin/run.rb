require_relative '../config/environment'
require_all 'app'
require "faker"
require "colorize"

#runner file for the program


  input = 0

#welcome screen and player start screen  
  welcome
  player = player_choose

#display character name and stats to show that he is starting the game
  puts"*********************************"
  puts "Starting Adventure For" + " #{player.name}".blue.bold
        player.show_stats
  puts"*********************************"

  #conditions for player to exit the game or to lose the game
  while input != "6" and player.hp > 0
    puts " "
    player.reload  #refresh the database to ensure relationships are fully established


#keep looping the selection prompts until player chooses to exit or loses the game
    input = selections
    exec_selection(player,input)
  end

  puts Faker::StarWars.quote.italic.green
