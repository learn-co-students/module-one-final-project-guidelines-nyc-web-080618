class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.text :title
      t.integer :difficulty
    end
  end
end
