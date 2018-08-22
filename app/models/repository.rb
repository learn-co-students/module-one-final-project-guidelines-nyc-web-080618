class Repository < ActiveRecord::Base
  has_many :user_repositories
  has_many :users, through: :user_repositories

  has_many :repository_languages
  has_many :languages, through: :repository_languages

  has_many :branches

  def fork_count
    user_repositories.where(forked: true).count
  end

  def forked_users
    user_repos_with_fork = user_repositories.where(forked: true)
    user_repos_with_fork.map do |user_repo|
      user_repo.user
    end
  end
end
