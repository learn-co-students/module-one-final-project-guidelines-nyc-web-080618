class Repository < ActiveRecord::Base
  has_many :user_repositories
  has_many :users, through: :user_repositories
end
