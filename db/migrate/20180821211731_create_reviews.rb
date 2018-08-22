class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :description #
      t.integer :rating #scale of one to 5
      t.integer :quality #scale of one to 5
      t.integer :easiness #scale of one to 5
      t.integer :helpfulness #scale of one to 5
    end
  end
end
