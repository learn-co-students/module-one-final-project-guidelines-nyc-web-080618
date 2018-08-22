

class Weapon  < ActiveRecord::Base

  has_many :character_weapons
  has_many :characters, through: :character_weapons


  # def self.weapon_reward(quest_difficulty)
  #   if quest_difficulty == 1
  #     reward_array = Weapon.all.where("attack_power <=3")
  #   elsif quest_difficulty == 2
  #     reward_array = Weapon.all.where("attack_power >3 && attack_power <=6")
  #   else
  #     reward_array = Weapon.all.where("attack_power >6")
  #   end
  #     reward = reward_array.sample
  #     reward_name = reward.name
  #     puts "#{reward_name}"
  #     weapon_id = reward.id
  #     CharacterWeapon.new_character_weapon(self.id, weapon_id)
  #
  # end
  #









end #end Weapon class
