class RemoveColumnTeacher < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :first_name, :string
    remove_column :teachers, :last_name, :string
  end
end
