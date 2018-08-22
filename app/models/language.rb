class Language < ActiveRecord::Base
  has_many :repository_languages
  has_many :repositories, through: :repository_languages

  has_many :users, through: :repositories
end
