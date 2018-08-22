class AddingNameColumnTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :name, :string
  end
end
