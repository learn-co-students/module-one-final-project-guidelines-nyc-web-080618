class User < ActiveRecord::Base
  has_many :user_repositories
  has_many :repositories, through: :user_repositories

  has_many :languages, through: :repositories

  has_many :branches, through: :repositories
end
