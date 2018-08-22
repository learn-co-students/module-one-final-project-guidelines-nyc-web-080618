class User < ActiveRecord::Base
  has_many :user_repositories
  has_many :repositories, through: :user_repositories

  has_many :languages, through: :repositories

  has_many :branches, through: :repositories

  def fork_repo(repository)
    # add our user to that repo
    #new_repo = Repository.create(name: repository.name)
    UserRepository.create(user_id: self.id, repository_id: repository.id, forked: true)
    # new_repo
  end

  def forks
    user_forks_arr = user_repositories.where(forked: true)
    user_forks_arr.map do |user_fork|
      user_fork.repository
    end
  end

  def self.search_repositories_by_username(name)
    user = User.find_by(name: name)
    user_repos = UserRepository.where(user_id: user.id)
    user_repos.map do |user_repo|
      user_repo.repository
    end
  end

  def add_collaborator(user, repository)
    UserRepository.create(user_id: user.id, repository_id: repository.id, forked: false)
  end

  def get_repos_by_languages(language)
    found_repos = []
    repositories.each do |repo|
      repo.repository_languages.each do |repo_lang|
        if repo_lang.language_id == language.id
          found_repos << repo
        end
      end
    end
    found_repos
  end
end

# ^^^^ test data ^^^^
# repo = Repository.find(94)
# UserRepository.find_by(repository_id: repo.id)
# user = User.find(2)
# lang = Language.find(7)
# user.get_repos_by_languages(lang)
