class CreateCharacterQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :character_quests do |t|
      t.integer :character_id
      t.integer :quest_id
    end

  end
end
