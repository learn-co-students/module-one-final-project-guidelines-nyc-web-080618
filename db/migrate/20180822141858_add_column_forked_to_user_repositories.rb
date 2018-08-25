class AddColumnForkedToUserRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :user_repositories, :forked, :boolean
  end
end
