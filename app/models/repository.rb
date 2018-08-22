class Repository < ActiveRecord::Base
  has_many :user_repositories
  has_many :users, through: :user_repositories

  has_many :repo_langs
  has_many :languages, through: :repo_langs
end
