require"colorize"
class Character  < ActiveRecord::Base
  has_many :character_weapons
  has_many :weapons, through: :character_weapons

  has_many :character_quests
  has_many :quests, through: :character_quests

  def self.new_character(name)
    Character.create(name: name, hp: 50, power: 1)
  end

  def get_completed_quests
    if self.quests.size == 0
      puts "You have not completed any quests!!!".red
    else
      puts "Completed Quests:".underline
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
      puts "**** #{weapon.name} **** Weapon Power: #{weapon.attack_power} ****".italic
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
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "You have completed all recommended quests!!!"
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
    else
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "Recommended Quests for Player Attack: #{self.power}".bold.blue
      puts ""
      self.print_quests(difficulty)
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^".red
      puts "Select a quest number"
      puts "Number:"
      selection = gets.chomp
      if selection.to_i > self.get_recommended_quests(difficulty).size || selection.to_i < 1
        puts "Invalid input, please try again!".red.bold
      else
        puts"*******************************************"
        puts "You have completed: #{self.get_recommended_quests(difficulty)[selection.to_i-1].title}"
        puts"*******************************************"
        puts " "
        puts"#####################################".blink
        puts "Time For Your Reward Adventurer!!!"
        available_weapons = self.get_available_weapons(difficulty)
        self.quest_selection(selection, difficulty)
        self.weapon_reward(available_weapons)
      end
    end
  end

  def weapon_reward(available_weapons)
    reward = available_weapons.sample
    CharacterWeapon.new_character_weapon(self.id, reward.id)
    puts "#{reward.name}".bold.blue
    puts "Weapon Power: #{reward.attack_power}"
    puts"#####################################".blink
      if reward.attack_power > self.power - 1 || self.power == 1
        self.update(power: 1+reward.attack_power)
      end
  end

  def recommended_targets
    Character.all.select do |character|
      character.power <= (self.power + 2) && character != self
    end
  end

  def print_recommended_targets
    find_target_sample = self.recommended_targets.sample(5)
    puts "Recommended Targets".bold.underline
    puts "Your Attack Power: #{self.power}".italic.blue
    find_target_sample.each_with_index do |target , i|
      puts "***********************".bold.red
      puts "#{i+1}. #{target.name}".bold
      puts "    Attack Power:#{target.power}"
      puts "    HP: #{target.hp}"
    end
    puts "***********************".bold.red
    find_target_sample
  end

  def select_target
    target_list = print_recommended_targets
    puts "Select Your Target By Number".bold.yellow
    input = gets.chomp
    if input.to_i > 5 || input.to_i < 1
      puts"Please Input Valid Target Number".red.bold
      self.select_target
    else
      target = target_list[input.to_i - 1]
    end
  end


  def attack(target)
    if self.power == target.power
      if rand > 0.5
        target.update_hp(-10)
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        puts "#{self.name} Has Defeated #{target.name}"
        puts "#{self.name} HP: #{self.hp}"
        if target.hp > 0
          puts "#{target.name} HP: #{target.hp}"
        end
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      else
        self.update_hp(-10)
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        puts "#{self.name} Has Lost Battle to #{target.name}".bold
        puts "#{self.name} HP: #{self.hp}"
        puts "#{target.name} HP: #{target.hp}"
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      end
    elsif self.power > target.power
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      if rand < (0.4 + ((self.power - target.power).to_f/4))
        target.update_hp(-5*(self.power - target.power))
        puts "#{self.name} Has Defeated #{target.name}".bold
        puts "#{self.name} HP: #{self.hp}"
        if target.hp > 0
          puts "#{target.name} HP: #{target.hp}"
        end
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      else
        self.update_hp(-10)
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        puts "#{self.name} Has Lost Battle to #{target.name}".bold
        puts "#{self.name} HP: #{self.hp}"
        puts "#{target.name} HP: #{target.hp}"
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      end
    else
      if rand > (0.45 + ((target.power - self.power).to_f/4))
        target.update_hp(-2*(-self.power + target.power))
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        puts "#{self.name} Has Defeated #{target.name}"
        puts "#{self.name} HP: #{self.hp}"
        if target.hp > 0
          puts "#{target.name} HP: #{target.hp}"
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        end
      else
        self.update_hp(-3*(-self.power + target.power))
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        puts "#{self.name} Has Lost Battle to #{target.name}".bold.yellow
        puts "#{self.name} HP: #{self.hp}"
        puts "#{target.name} HP: #{target.hp}"
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      end
    end
  end


  def update_hp(change)
    self.update(hp:self.hp + change)
    if self.hp <= 0
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      puts "#{self.name} IS DEAD !!!!!!!!!!!".bold.red
      self.destroy
    end
  end


  def show_stats
      puts "*********************************"
    if self.weapons.size == 0
      puts "Current Health:".red + " #{self.hp}".bold
      puts "Current Power:".blue + " #{self.power}".bold
    else
      puts "Current Health:".red + " #{self.hp}".bold
      puts "Current Power:".blue + " #{self.power}".bold
      puts "Equipped Weapon:".green + " #{self.highest_attack_power_weapon.name}".bold
    end
  end







end #end Character class
