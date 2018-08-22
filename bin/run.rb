require_relative '../config/environment'
require_all 'app'

  welcome

  player = character_creation
  input = selections
  exec_selection(player, input)

  while input != "6"
    puts " "
    input = selections
    exec_selection(player,input)
    puts " "


  end
