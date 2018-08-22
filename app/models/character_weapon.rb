

class CharacterWeapon  < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon

  def self.new_character_weapon(character_id, weapon_id)
    self.create(character_id: character_id, weapon_id: weapon_id)

  end












end #end CharacterWeapon class
