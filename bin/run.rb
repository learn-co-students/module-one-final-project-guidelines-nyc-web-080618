require_relative '../config/environment'
require 'commander/import'

def read_menu(current_user)
  puts "What info would you like"
  puts "1. Read a user"
  puts "2. Read a repository"
  puts "3. Read your repositories"
  puts "4. Read your forked repositories"
  puts "5. Read users who forked your repositories"
  puts "6. Read your starred repositories"
  puts "7. Search your repositories by programming language"
  puts "8. See your followers"
  puts "9. See users you follow"
  puts "Type 'exit' to exit"

  read_input = gets.chomp

  case read_input
  when "1"
    foundUser = false
    while !foundUser
      puts "Who are you looking for?"
      userInput = gets.chomp
      user = User.find_by(username: userInput)
      if user
        puts user.name
        foundUser = true
      else
        puts "#{userInput} does not exist."
      end
    end
  when "2"
    foundRepo = false
    while !foundRepo
      puts "Enter the repository name"
      repoName = gets.chomp
      repo = Repository.find_by(name: repoName)
      if repo
        puts repo.name
        foundRepo = true
      else
        puts "#{repoName} does not exist."
      end
    end
  when "3"
    puts "Here are your repositories..."
    current_user.repositories.each_with_index do |my_repo|
      puts "#{i+1}. #{my_repo.name}"
    end
  when "4"
    puts current_user.forks
  when "5"
    puts current_user.users_that_forked_our_repos
  when "6"
    current_user.my_starred_repositories
  when "7"
    puts "What language are you looking for?"
    langInput = gets.chomp # string
    langObj = Language.find_by(name: langInput) # Langauge object
    if langObj # Check if language was found
      foundLangs = current_user.get_repos_by_languages(langObj)
      if foundLangs.empty?
        puts "No repositories found using #{langInput}."
      else
        foundLangs.each_with_index do |found_repo_lang, i|
          puts "#{i+1}. #{found_repo_lang.name}"
        end
      end # end foundLangs.empty?
    else
      puts "#{langInput} not found."
    end # end langObj
  when "8"
    puts current_user.my_followers
  when "9"
    puts current_user.users_i_follow
  when "exit"
    return true
  else
    puts " "
  end
end

def main
  puts "Welcome!"
  speak ""

  name = ask("Name: ")

  username = ask("Username: ")

  email = ask("Email: ")

  current_user = User.find_by(name: "Justin")
  speak "Hello #{name}"
  input = ""
  while input != "exit"
    puts "What would you like to do? Type exit to exit"
    puts "1. Create a repository"
    puts "2. Read a repository (name)"
    puts "3. Update a repository"
    puts "4. Delete a repository"
    input = gets.chomp
    case input
    when "1" ### CREATE
      # system "clear" or system "cls"
      puts "What is the name of your repository?"
      name_input = gets.chomp
      current_user.create_repo(name_input)
    when "2" ### READ
      readExit = false
      while !readExit
        readExit = read_menu(current_user)
      end
      # system "clear" or system "cls"
    when "3" ### UPDATE
      # system "clear" or system "cls"
      puts "What repository are you updating?"
      name_input = gets.chomp
      repo = Repository.find_by(name: name_input)
      puts "What would you like to rename the repo?"
      repo.update(name: gets.chomp)
      puts repo
    when "4" ### DESTROY
      # system "clear" or system "cls"
      puts "Which repository are you deleting?"
      name_input = gets.chomp
      repo = Repository.find_by(name: name_input)
      repo.destroy
      puts "Repo deleted. Trust me"
    when "exit"
      system "clear" or system "cls"
      break
    else
      puts "Not a valid choice, try again.\n"
      system "clear" or system "cls"
    end
  end
end # end main

main
