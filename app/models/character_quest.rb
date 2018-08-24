#this is the join table between character and quest class


class CharacterQuest  < ActiveRecord::Base
  belongs_to :character
  belongs_to :quest

  #this instantiates a new join table object
  #inputs are character id and quest id and it returns a new characterquest object
  def self.new_character_quest(character_id, quest_id)
    self.create(character_id: character_id, quest_id: quest_id)

  end







end #end CharacterQuest class
