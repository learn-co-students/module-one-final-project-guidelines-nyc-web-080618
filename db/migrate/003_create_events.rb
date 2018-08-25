class CreateEvents < ActiveRecord::Migration[5.0]

  def change
    create_table :events do |t|
      t.string :name 
      t.datetime :time
      t.float :price
      t.integer :artist_id
      t.integer :city_id
      t.string :event_type
    end
  end

end
