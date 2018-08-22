

class Character  < ActiveRecord::Base
  has_many :character_weapons
  has_many :weapons, through: :character_weapons

  has_many :character_quests
  has_many :quests, through: :character_quests

  def self.new_character(name)
    Character.create(name: name, hp: 100, power: 1)
  end

  def get_completed_quests
    if self.quests.size == 0
      puts "You have not completed any quests!!!"
    else
      puts "Completed Quests:"
      self.quests.each_with_index do |quest, i|
        puts "#{i+1}: #{quest.title}"
      end
    end
  end

  def get_uncompleted_quests()
    Quest.all.select do |quest|
      quest.characters.include?(self) == false
    end
  end

  def get_recommended_quests(difficulty)
    self.get_uncompleted_quests.select do |quest|
      quest.difficulty == difficulty
    end
  end

  def print_quests(difficulty)
    self.get_recommended_quests(difficulty).each_with_index do |quest, i|
      puts "#{i+1}: #{quest.title}"
    end
  end

  def quest_selection(input, difficulty)
    quest_id = self.get_recommended_quests(difficulty)[input-1].id
    CharacterQuest.new_character_quest(self.id, quest_id)
  end




  def show_all_weapons
    self.weapons.each do |weapon|
      puts "**** #{weapon.name} **** Attack Power: #{weapon.attack_power} ****"
    end
  end

  def highest_attack_power_weapon
    weapon = self.weapons.sort_by do |weapon|
      weapon.attack_power
    end.last
    weapon
  end

  def get_available_weapons(difficulty)
    if difficulty == 1
      available_weapons = Weapon.all.where("attack_power <=3").select do |weapon|
        weapon.characters.include?(self) == false
      end
    end
  end

    #   reward_array = self.get_available_weapons.where("attack_power <=3")
    # elsif difficulty == 2
    #   reward_array = self.get_available_weapons.where("attack_power >3 && attack_power <=6")
    # else
    #   reward_array = self.get_available_weapons.where("attack_power >6")
    # end




  #   Weapon.all.where(select do |weapon|
  #     weapon.characters.include?(self) == false
  #   end
  # end



  def weapon_reward(available_weapons)
      reward = available_weapons.sample
      reward_name = reward.name
      puts "#{reward_name}"
      puts "Attack Power: #{reward.attack_power}"
      weapon_id = reward.id
      CharacterWeapon.new_character_weapon(self.id, weapon_id)

      # if reward.attack_power > highest_attack_power_weapon.attack_power || self.power == 1
      #   self.update(power: self.power+reward.attack_power)
      # end



  end

  def show_stats
    puts "Current health: #{self.hp}"
    puts "Current power: #{self.power}"
    puts "Equipped weapon: #{self.highest_attack_power_weapon.name}"

  end







end #end Character class
