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
    User.create(name: Faker::Name.unique.name)
  end
puts "done with users"

puts "creating repositories"
  User.all.each do |user|
    user.create_repo(Faker::MichaelScott.unique.quote)
  end
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
