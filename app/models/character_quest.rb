

class CharacterQuest  < ActiveRecord::Base
  belongs_to :character
  belongs_to :quest


  def self.new_character_quest(character_id, quest_id)
    self.create(character_id: character_id, quest_id: quest_id)

  end







end #end CharacterQuest class
