class UpdateColumnFeelings < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :feelings, :string 
  end
end
