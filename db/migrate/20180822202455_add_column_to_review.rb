class AddColumnToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :teacher_id, :integer
    add_column :reviews, :student_id, :integer
  end
end
