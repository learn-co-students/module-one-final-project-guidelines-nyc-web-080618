require 'faker'

puts "clearing all existing data"
  Faker::UniqueGenerator.clear
  User.destroy_all
  Repository.destroy_all
  UserRepository.destroy_all
  Language.destroy_all
  RepositoryLanguage.destroy_all
  Branch.destroy_all
puts "done clearing"

puts "creating users"
  5.times do |i|
    User.create(name: Faker::Name.unique.name, username: Faker::LordOfTheRings.unique.character, email: Faker::Internet.unique.email)
  end

  User.create(name: "Justin", username: "jwang", email: "jwang138@binghamton.edu")
  User.create(name: "Jesse", username: "jessemcready", email: "jessemcready@gmail.com")
puts "done with users"

puts "creating repositories"
  User.all.each do |user|
    user.create_repo(Faker::MichaelScott.unique.quote)
  end
  User.find_by(username: "jwang").create_repo("cool repo")
  User.find_by(username: "jessemcready").create_repo("my repo is better than justins")
puts "done with repositories"

puts "creating languages"
  10.times do |i|
    Language.create(name: Faker::ProgrammingLanguage.unique.name)
  end
puts "done with languages"

puts "creating repository_languages"
  15.times do |i|
    RepositoryLanguage.create(repository_id: Repository.all.sample.id, language_id: Language.all.sample.id)
  end
puts "done with repository_languages"

puts "creating branches"
  10.times do |i|
    Branch.create(name: Faker::SiliconValley.unique.company, repository_id: Repository.all.sample.id)
  end
puts "done with branches"

puts "star some repos"
  User.all.each do |user|
    user.star_repo(Repository.all.sample)
    user.star_repo(Repository.all.sample)
    user.star_repo(Repository.all.sample)
  end
puts "done with stars"

puts "make some forks"
  User.all.each do |user|
    user.fork_repo(Repository.all.sample)
    user.fork_repo(Repository.all.sample)
    user.fork_repo(Repository.all.sample)
  end
puts "done forking"
