class RemoveColumnStudent < ActiveRecord::Migration[5.0]

    def change
      remove_column :students, :first_name, :string
      remove_column :students, :last_name, :string
    end

end
