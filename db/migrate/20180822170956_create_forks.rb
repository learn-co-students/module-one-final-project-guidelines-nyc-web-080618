class CreateForks < ActiveRecord::Migration[5.0]
  def change
    create_table :forks do |t|
      t.string :name
      t.integer :repository_id
    end
  end
end
