require 'pry'
require 'commander/import'
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :user_repositories
  has_many :repositories, through: :user_repositories

  has_many :languages, through: :repositories

  has_many :branches, through: :repositories

  has_many :stars

  has_many :followers, :foreign_key => :follower_id
  has_many :followees, :class_name => "User", :foreign_key => :followee_id

  def create_repo(name)
    repo = Repository.create(name: name)
    UserRepository.create(user_id: self.id, repository_id: repo.id, forked: false)
  end # end create_repo

  def fork_repo(repository)
    # add our user to that repo
    repo = create_repo(repository.name)
    repo.update(forked: true)
    UserRepository.create(user_id: self.id, repository_id: repository.id, forked: true)
  end # end fork_repo

  def forks
    user_forks_arr = user_repositories.where(forked: true)
    user_forks_arr.map do |user_fork|
      user_fork.repository
    end # end map
  end # end forks

  def users_that_forked_our_repos
    # get all our original repos
    # get all forks of those repos
    # get all users of those forks
    our_repos = user_repositories.where(forked: false)
    our_forked_users = our_repos.map do |repo|
      repo.repository.users
    end.flatten # end map
    our_forked_users.select do |user|
      user.id != self.id
    end # end select
  end # end users_that_forked_our_repos

  def self.search_repositories_by_username(username)
    user = User.find_by(username: username)
    user_repos = UserRepository.where(user_id: user.id)
    user_repos.map do |user_repo|
      user_repo.repository
    end # end map
  end # end self.search_repositories_by_username

  def add_collaborator(user, repository)
    UserRepository.create(user_id: user.id, repository_id: repository.id, forked: false)
  end # end add_collaborator

  def get_repos_by_languages(language)
    found_repos = []
    repositories.each do |repo|
      repo.repository_languages.each do |repo_lang|
        if repo_lang.language_id == language.id
          found_repos << repo
        end # end if
      end # end each
    end # end each
    found_repos
  end # end get_repos_by_languages

  def star_repo(repo)
    if (Star.find_by(user_id: self.id, starred_repository_id: repo.id))
      puts "You already starred this repository!"
    else
      Star.create(user_id: self.id, starred_repository_id: repo.id)
    end # end if
  end # end star_repo

  def my_starred_repositories
    # self.stars.each_with_index do |star_repo, i|
    #   puts "#{i+1}. #{star_repo.starred_repository.name}"
    #   speak "#{i+1}. #{star_repo.starred_repository.name}"
    #   sleep(5)
    # end
    stars.map do |star|
      star.starred_repository
    end
  end


  def follow_user(username)
    user = User.find_by(username: username)
    Follower.create(follower_id: self.id, followee_id: user.id)
  end  # end follow_user

  def my_followers
    follows = Follower.where(followee_id: self.id)
    follows.map do |follow|
      follow.follower
    end # end map
  end # end my_followers

  def users_i_follow
    my_users = Follower.where(follower_id: self.id)
    my_users.map do |my_user|
      my_user.followee
    end # end map
  end # end users_i_follow

end # end class User
