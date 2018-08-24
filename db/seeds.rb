require "pry"
require "faker"


  ##characters
  puts "making characters"
  5.times do
  Character.create(name: Faker::Ancient.unique.god, hp:50, power:1)
  end

  #puts "done with characters"
  ######quests
  puts "making quests"
  30.times do
  Quest.create(title:Faker::WorldOfWarcraft.unique.quote, difficulty: rand(1..3))
  end

  puts "done with quests"



  ####weapons
  puts "making weapons"
  30.times do
  Weapon.create(name:Faker::Dota.unique.item, attack_power: rand(1..10))
  end


  puts "done with weapons"


#   ####character_weapons
#   puts "making character_weapons"
#   10.times do
#   CharacterWeapon.create(character_id: Character.all.sample.id, weapon_id: Weapon.all.sample.id)
#   end
#
#
#
#   puts "done with characters_weapons"
#
#
#   ####character_quests
#   puts "making character_quests"
#
#   10.times do
#   CharacterQuest.create(character_id: Character.all.sample.id, quest_id: Quest.all.sample.id)
#   end
#
#
#
#   puts "done with characters_quests"
#
#
#
#
#
#
#
#
#
# #binding.pry
