require_relative '../config/environment'
require_all 'app'
require "faker"


  input = 0
  welcome
  player = player_choose
  puts"*********************************"
  puts "Starting adventure for #{player.name} "
        player.show_stats
  puts"*********************************"
  while input != "6" and player.hp > 0
    puts " "
    player.reload
    input = selections
    exec_selection(player,input)
  end

  puts Faker::GreekPhilosophers.quote
