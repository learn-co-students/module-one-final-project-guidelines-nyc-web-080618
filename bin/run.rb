require_relative '../config/environment'
require_all 'app'
  input = 0
  welcome

  player = character_creation
  # input = selections
  # exec_selection(player, input)

  while input != "6"
    puts " "
    puts "entering loop #{player.name}"
    puts "ID: #{player.id}"
    player.reload
    input = selections
    exec_selection(player,input)
    #puts " "
    puts "************************"
    puts "exiting loop #{player.name}"
    puts "ID: #{player.id}"


  end
