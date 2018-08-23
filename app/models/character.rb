

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
    # completed_quest_id = CharacterQuest.where(character_id: self.id).pluck(:quest_id)
    # Quest.where.not(id: completed_quest_id)
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
    quest_id = self.get_recommended_quests(difficulty)[input.to_i-1].id
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
    elsif difficulty == 2
      available_weapons = Weapon.all.where("attack_power >3 and attack_power <= 6").select do |weapon|
        weapon.characters.include?(self) == false
      end
    else
      available_weapons = Weapon.all.where("attack_power > 6").select do |weapon|
        weapon.characters.include?(self) == false
      end
    end
  end

  def get_difficulty
    if self.power < 3
      difficulty = 1
    elsif self.power >= 3 && self.power < 6
      difficulty = 2
    else
      difficulty = 3
    end
  end

  def quest_interface
    difficulty = self.get_difficulty
    if self.get_recommended_quests(difficulty).size == 0
      puts "You have completed all recommended quests!!!"
    else
      puts "Here are quests we recommend for Player Attack: #{self.power}"
      self.print_quests(difficulty)
      puts "Select a quest number"
      puts "Number:"
      selection = gets.chomp
      if selection.to_i > self.get_recommended_quests(difficulty).size || selection.to_i < 1
        puts "Invalid input, please try again!"
      else
        puts "You have completed: #{self.get_recommended_quests(difficulty)[selection.to_i-1].title}"
        puts " "
        puts "Time for your reward adventurer!!!"
        available_weapons = self.get_available_weapons(difficulty)
        self.quest_selection(selection, difficulty)
        self.weapon_reward(available_weapons)
      end
    end
  end

  def weapon_reward(available_weapons)
    reward = available_weapons.sample
    CharacterWeapon.new_character_weapon(self.id, reward.id)
    puts "#{reward.name}"
    puts "Attack Power: #{reward.attack_power}"
      if reward.attack_power > self.power - 1 || self.power == 1
        self.update(power: 1+reward.attack_power)
      end
  end



  def show_stats
    if self.weapons.size == 0
      puts "Current health: #{self.hp}"
      puts "Current power: #{self.power}"
    else
      puts "Current health: #{self.hp}"
      puts "Current power: #{self.power}"
      puts "Equipped weapon: #{self.highest_attack_power_weapon.name}"
    end
  end







end #end Character class
