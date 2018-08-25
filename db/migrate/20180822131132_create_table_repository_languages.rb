class CreateTableRepositoryLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :repository_languages do |t|
      t.integer :repository_id
      t.integer :languages_id
    end
  end
end
