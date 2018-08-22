require 'faker'

puts "creating users"
  10.times do |i|
    User.create(name: Faker::Name.unique.name)
  end
puts "done with users"

puts "creating repositories"
  10.times do |i|
    Repository.create(name: Faker::MichaelScott.unique.quote)
  end
puts "done with repositories"

puts "creating user_repositories"
  10.times do |i|
    UserRepository.create(user_id: User.sample.id, repository_id: Repository.sample.id)
  end
puts "done with user_repositories"

puts "creating languages"
  10.times do |i|
    Language.create(name: Faker::ProgrammingLanguage.unique.name)
  end
puts "done with languages"

puts "creating repository_languages"
  10.times do |i|
    RepositoryLanguage.create(repository_id: Repository.sample.id, language_id: Language.sample.id)
  end
puts "done with repository_languages"

puts "creating branches"
  10.times do |i|
    Branch.create(name: Faker::SiliconValley.unique.company, repository_id: Repository.sample.id)
  end
puts "done with branches"
