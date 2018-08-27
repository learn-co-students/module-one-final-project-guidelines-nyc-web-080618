class RenameColumnTeachers < ActiveRecord::Migration[5.0]
  def change
    rename_column :teachers, :firstname, :first_name
    rename_column :teachers, :lastname, :last_name
  end
end
