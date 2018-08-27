class ChangeColumnReviews < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :feelings, :integer
  end
end
