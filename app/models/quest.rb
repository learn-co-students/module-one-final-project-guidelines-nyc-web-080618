

class Quest  < ActiveRecord::Base
  has_many :character_quests
  has_many :characters, through: :character_quests













end #end Quest class
