#Character class
require"colorize"
require "artii"

#methods for character class


class Character  < ActiveRecord::Base
  has_many :character_weapons
  has_many :weapons, through: :character_weapons

  has_many :character_quests
  has_many :quests, through: :character_quests

#instantiate a new character
#only argument is name and default hp and power is set here
  def self.new_character(name)
    Character.create(name: name, hp: 50, power: 1)
  end

#######Methods for completing quests####################


#show the player his completed quests
  def get_completed_quests

#check if the player has actually completed any quests
#if he has not, tell him
    if self.quests.size == 0
      puts "You have not completed any quests!!!".red

#otherwise, pull the completed quest objects and print the quest titles
    else
      puts "Completed Quests:".underline
      self.quests.each_with_index do |quest, i|
        puts "#{i+1}: #{quest.title}"
      end
    end
  end

#method for obtaining the uncompleted quests for a given player
#returns quest instances
  def get_uncompleted_quests()
    Quest.all.select do |quest|
      quest.characters.include?(self) == false
    end

  end

#use the uncompleted quest instances to obtain those
#that are of a certain difficulty
  def get_recommended_quests(difficulty)
    self.get_uncompleted_quests.select do |quest|
      quest.difficulty == difficulty
    end
  end

#print the quest titles of the uncompleted quests
#that are of a specified difficulty
  def print_quests(difficulty)
    self.get_recommended_quests(difficulty).each_with_index do |quest, i|
      puts "#{i+1}: #{quest.title}"
    end
  end

#after the player selects a quest
#instantiate a new CharacterQuest object to show
#that player has actually completed the quest
  def quest_selection(input, difficulty)
    quest_id = self.get_recommended_quests(difficulty)[input.to_i-1].id
    CharacterQuest.new_character_quest(self.id, quest_id)
  end



#print all of the acquired weapons for a certain player
  def show_all_weapons
    if self.weapons.size == 0
      puts ""
      puts "You have no weapons, try completing some quests first :)"
    else
      puts ""
      puts "Here Are Your Weapons:".bold.white.on_light_black
      puts " "
      self.weapons.each do |weapon|
        puts "**** #{weapon.name} **** Weapon Power: #{weapon.attack_power} ****".italic
      end
    end
  end

#obtain the weapon instance with the highest attack power for a certain player
  def highest_attack_power_weapon
    weapon = self.weapons.sort_by do |weapon|
      weapon.attack_power
    end.last
    weapon
  end


#this method obtains all of the weapons available to a certain player
#argument passed in is difficulty level, so this will only show weapons of certain attack powe
  def get_available_weapons(difficulty)

#if the difficulty of the quest is 1
#only select weapons with attack power less than or equal to 3
# and that the player has not yet obtained
    if difficulty == 1
      available_weapons = Weapon.all.where("attack_power <=3").select do |weapon|
        weapon.characters.include?(self) == false
      end

#if the difficulty of the quest is 2
#only select weapons with attack power greater than 3 and less than or equal to 6
# and that the player has not yet obtained
    elsif difficulty == 2
      available_weapons = Weapon.all.where("attack_power >3 and attack_power <= 6").select do |weapon|
        weapon.characters.include?(self) == false
      end


#if the difficulty of the quest is 3
#only select weapons with attack power greater than 6
# and that the player has not yet obtained
    else
      available_weapons = Weapon.all.where("attack_power > 6").select do |weapon|
        weapon.characters.include?(self) == false
      end
    end
  end

#method for obtaining a player's difficulty setting
#this is solely based on the attack power of the current player
  def get_difficulty
    if self.power < 3
      difficulty = 1
    elsif self.power >= 3 && self.power < 6
      difficulty = 2
    else
      difficulty = 3
    end
  end

#method for player executing a quest
  def quest_interface

#obtain the difficulty level for the given player
    difficulty = self.get_difficulty

#see if the player has any quests left to complete
    if self.get_recommended_quests(difficulty).size == 0
      puts "=====================================".red
      puts "=====================================".red
      puts "You have completed all recommended quests!!!".bold
      puts "=====================================".red
      puts "=====================================".red

#show the player the available quests
    else
      puts "=====================================".red
      puts "=====================================".red
      puts "Recommended Quests for Player Attack: #{self.power}".blue.on_light_green.bold
      puts ""
      self.print_quests(difficulty)
      puts "=====================================".red
      puts "=====================================".red
      puts "Select a quest number".bold.white.on_light_blue
      puts "Number:".bold

#selection prompt the player to actually choose a quest
      selection = gets.chomp

#check for invalid input
      if selection.to_i > self.get_recommended_quests(difficulty).size || selection.to_i < 1
        puts "Invalid input, please try again!".red.bold

#if input is valid, show the player that he has completed the quest
      else
        puts"*******************************************"
        puts "You have completed: #{self.get_recommended_quests(difficulty)[selection.to_i-1].title}".bold
        puts"*******************************************"
        puts " "
        puts"#####################################".blink
        puts "Time For Your Reward Adventurer!!!".bold.blue.on_light_yellow

        #obtain the available weapons based on player difficulty
        available_weapons = self.get_available_weapons(difficulty)

        #create the new characterquest instance to show that player has completed the quest
        self.quest_selection(selection, difficulty)

        #run the weapon_reward method to get reward for the quest
        self.weapon_reward(available_weapons)
      end
    end
  end

#method for getting the reward after completing a quest
#argument passed in is array of available weapon objects
  def weapon_reward(available_weapons)

    #reward is 1 random choice from this array
    reward = available_weapons.sample

    #create to CharacterWeapon object to show that player obtains weaopn
    CharacterWeapon.new_character_weapon(self.id, reward.id)

    #print weapon details to player
    puts "#{reward.name}".bold.blue
    puts "Weapon Power: #{reward.attack_power}"
    puts"#####################################".blink

  #actually equip the weapon, if it will increase this player's attack power
      if reward.attack_power > self.power - 1 || self.power == 1
        #increase the player's attack power
        self.update(power: 1+reward.attack_power)
      end
  end


#######Methods for fighting other players####################

#obtain potential targets for a given player
#only select other characters with power less than or equal to
#player's power + 2 level
#this will return character objects
  def recommended_targets
    Character.all.select do |character|
      character.power <= (self.power + 2) && character != self
    end
  end

#print a list of the recommended targets to the player
#this will return a random sample of 5 of the potential targets
#for the given player
  def print_recommended_targets
    find_target_sample = self.recommended_targets.sample(5)

      puts "Recommended Targets".bold.underline
      puts "Your Attack Power: #{self.power}".italic.blue
      find_target_sample.each_with_index do |target , i|

        #display the target's name and relevant stats
        puts "***********************".bold.red
        puts "#{i+1}. #{target.name}".bold.blue.on_light_yellow
        puts "    ID: #{target.id}".bold
        puts "    Attack Power:#{target.power}"
        puts "    HP: #{target.hp}"
      end
      puts "***********************".bold.red

      #return the target sample objects
      find_target_sample

  end

#method for player selecting a target
  def select_target
    target_list = print_recommended_targets

#check to see if there are any available targts
    if target_list.size == 0
      puts "There are no available targets!".bold.red
      target = nil

#get input for available targets
    else
      puts "Select Your Target Number".bold.white.on_light_blue
      input = gets.chomp

      #check if the input is valid and prompt the user again
      if input.to_i > 5 || input.to_i < 1
        puts"Please input valid target number".red.bold
        self.select_target

      #select the target
      else
        target = target_list[input.to_i - 1]

      end
    end
  end


#method for the actual combat
  def attack(target)

    #check to see if there is any target
    if target == nil
          puts "Invite some friends to play this awesome game.".blue

    else
      #print fighting for the user

      puts Artii::Base.new.asciify "Fight"



    ###methods for determining probability of victory
    ###and damage to the opponent or current user#####

    #if the characters have the same attack power
      if self.power == target.power

        #if the player wins the battle
        if rand > 0.5

          #reduce the target's hp by 10
          target.update_hp(-10)

          #display outcome of the battle to the player
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
          puts "#{self.name} Has Defeated #{target.name}".green.on_light_blue.bold
          puts "#{self.name} HP: #{self.hp}"

          #see if the target is still alive
          if target.hp > 0
            puts "#{target.name} HP: #{target.hp}"
          end
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink

        #if the player loses the battle
        #reduce the player's hp
        else
          self.update_hp(-10)

          #display outcome of the battle to the player
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
          puts "#{self.name} Has Lost Battle to #{target.name}".black.on_light_red
          puts "#{self.name} HP: #{self.hp}"
          puts "#{target.name} HP: #{target.hp}"
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        end

      #if the player has a greater attack power than that of the target
      elsif self.power > target.power
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink

        #if the player wins the battle
        #calculation based on distance between the attack powers
        #of the player and target
        if rand < (0.4 + ((self.power - target.power).to_f/4))

          #reduce hp of the target
          target.update_hp(-5*(self.power - target.power))

          #print outcome of the battle
          puts "#{self.name} Has Defeated #{target.name}".green.on_light_blue.bold
          puts "#{self.name} HP: #{self.hp}"

          #check if target still alive
          if target.hp > 0
            puts "#{target.name} HP: #{target.hp}"
          end
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink

        #if the player loses the battle
        #reduce the player's hp
        else
          self.update_hp(-10)

          #display outcome of the battle to the player
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
          puts "#{self.name} Has Lost Battle to #{target.name}".black.on_light_red
          puts "#{self.name} HP: #{self.hp}"
          puts "#{target.name} HP: #{target.hp}"
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        end

      #if the player has a lower attack power than that of the target
      else

        #if the player wins the battle
        #calculation based on distance between the attack powers
        #of the player and target
        if rand > (0.45 + ((target.power - self.power).to_f/4))

          #reduce hp of the target
          target.update_hp(-2*(-self.power + target.power))

          #display outcome of the battle to the player
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
          puts "#{self.name} Has Defeated #{target.name}".green.on_light_blue.bold
          puts "#{self.name} HP: #{self.hp}"

          #check if target still alive
          if target.hp > 0
            puts "#{target.name} HP: #{target.hp}"
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
          end

        #if the player loses the battle
        #reduce the player's hp
        else
          self.update_hp(-3*(-self.power + target.power))

          #display outcome of the battle to the player
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
          puts "#{self.name} Has Lost Battle to #{target.name}".black.on_light_red
          puts "#{self.name} HP: #{self.hp}"
          puts "#{target.name} HP: #{target.hp}"
          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
        end
      end
    end
  end

#method for updating a character object's hp
  def update_hp(change)
    self.update(hp:self.hp + change)

    #check to see if the character is dead
    if self.hp <= 0

      #display to the user that the character is dead
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$".blink
      puts "#{self.name} IS DEAD !!!!!!!!!!!".bold.red.on_black

      #destroy the object from the database
      self.destroy
    end
  end

#method for displaying the stats of a given player
  def show_stats
      puts "*********************************"

    #check to see if the player has any weapons
    #display stats
    if self.weapons.size == 0
      puts "Current Health:".red + " #{self.hp}".bold
      puts "Current Power:".blue + " #{self.power}".bold

    #display
    else
      puts "Current Health:".red + " #{self.hp}".bold
      puts "Current Power:".blue + " #{self.power}".bold
      puts "Equipped Weapon:".green + " #{self.highest_attack_power_weapon.name}".bold
    end
      puts "*********************************"
  end







end #end Character class
