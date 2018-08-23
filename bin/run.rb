require_relative '../config/environment'
require_all 'app'
require "faker"
require "colorize"

  input = 0
  welcome
  player = player_choose
  puts"*********************************"
  puts "Starting Adventure For" + " #{player.name}".blue.bold
        player.show_stats
  puts"*********************************"
  while input != "6" and player.hp > 0
    puts " "
    player.reload
    input = selections
    exec_selection(player,input)
  end

  puts Faker::StarWars.quote.italic.green
