class CreateSchools < ActiveRecord::Migration[5.0]
  def change

    create_table :schools do |t|
      t.string :name
      t.string :location
      t.integer :school_id #primary key
    end
  end
end
