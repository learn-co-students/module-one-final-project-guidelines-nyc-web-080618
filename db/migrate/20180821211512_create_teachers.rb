class CreateTeachers < ActiveRecord::Migration[5.0]
  def change

    create_table :teachers do |t|
      t.string :firstname
      t.string :lastname
    end
  end
end
