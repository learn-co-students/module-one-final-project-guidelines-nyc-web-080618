class AddColumnFeelings < ActiveRecord::Migration[5.0]
  def change

    add_column :reviews, :feelings, :string
  end
end
