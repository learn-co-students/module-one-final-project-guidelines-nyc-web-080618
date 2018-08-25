class RepositoryLanguage < ActiveRecord::Base
  belongs_to :repository
  belongs_to :language
end
