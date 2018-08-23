require 'pry'
class User < ActiveRecord::Base
  @forked_repositories = []

  attr_accessor :forked_repositories

  has_many :user_repositories
  has_many :repositories, through: :user_repositories
  # has_many :repositories, through: :user_repositories

  has_many :languages, through: :repositories

  has_many :branches, through: :repositories

  has_many :stars

  # has_many :forks, through: :repositories



  def create_repo(name)
    repo = Repository.create(name: name)
    UserRepository.create(user_id: self.id, repository_id: repo.id, forked: false)
  end

  def fork_repo(repository)
    # add our user to that repo
    repo = create_repo(repository.name)
    repo.update(forked: true)
    UserRepository.create(user_id: self.id, repository_id: repository.id, forked: true)
  end

  def forks
    user_forks_arr = user_repositories.where(forked: true)
    user_forks_arr.map do |user_fork|
      user_fork.repository
    end
  end

  def users_that_forked_our_repos
    # get all our original repos
    # get all forks of those repos
    # get all users of those forks
    our_repos = user_repositories.where(forked: false)
    our_forked_users = our_repos.map do |repo|
      repo.repository.users
    end.flatten
    our_forked_users.select do |user|
      user.id != self.id
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

  def star_repo(repo)
    if (Star.find_by(user_id: self.id, starred_repository_id: repo.id))
      puts "You already starred this repository!"
    else
      Star.create(user_id: self.id, starred_repository_id: repo.id)
    end
  end

  def my_starred_repositories
    self.stars.each_with_index do |star_repo, i|
      puts "#{i}. #{star_repo.starred_repository.name}"
    end
  end
end

# ^^^^ test data get_repos_by_languages ^^^^
# repo = Repository.find(94)
# UserRepository.find_by(repository_id: repo.id)
# user = User.find(2)
# lang = Language.find(7)
# user.get_repos_by_languages(lang)

# repo = Repository.create(name: "MEH")
# user1 = User.create(name: "Bleh")
# user2 = User.create(name: "Buh")
# user1.fork_repo(repo)
