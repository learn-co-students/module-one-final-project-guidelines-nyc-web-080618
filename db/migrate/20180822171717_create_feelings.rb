class CreateFeelings < ActiveRecord::Migration[5.0]
  def change
    create_table :feelings do |t|
      t.string :emoji
      t.integer :score
    end
  end
end
