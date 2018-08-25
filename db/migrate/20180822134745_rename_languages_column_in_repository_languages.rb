class RenameLanguagesColumnInRepositoryLanguages < ActiveRecord::Migration[5.0]
  def change
    rename_column :repository_languages, :languages_id, :language_id
  end
end
