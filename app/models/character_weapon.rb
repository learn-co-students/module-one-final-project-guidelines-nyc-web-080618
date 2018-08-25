#this is the join table between character and weapon class

class CharacterWeapon  < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon

  #this instantiates a new join table object
  #inputs are character id and weapon id and it returns a new characterweapon object

  def self.new_character_weapon(character_id, weapon_id)
    self.create(character_id: character_id, weapon_id: weapon_id)
  end












end #end CharacterWeapon class
