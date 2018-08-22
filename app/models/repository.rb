class Repository < ActiveRecord::Base
  has_many :user_repositories
  has_many :users, through: :user_repositories

  has_many :repository_languages
  has_many :languages, through: :repository_languages

  has_many :branches
end
