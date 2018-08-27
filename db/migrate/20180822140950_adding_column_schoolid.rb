class AddingColumnSchoolid < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :school_id, :integer
  end
end
