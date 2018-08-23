def read_menu(current_user)
  # system "clear" or system "cls"
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
end # end create_menu

def create_menu(current_user)
  # system "clear" or system "cls"

  puts "What are we doing today? Exit to exit"
  puts "1. Create Repository"
  puts "2. Fork Repository"
  puts "3. Star Repository"
  puts "4. Follow User"
  create_input = gets.chomp

  case create_input
  when "1"
    puts "Repository name: "
    current_user.create_repo(gets.chomp)
  when "2"
    found = false
    while !found
      puts "Repository name: "
      create_name_input = gets.chomp
      repo = Repository.find_by(name: create_name_input)
      if repo
        current_user.fork_repo(repo)
        found = true
      else
        puts "Repository not found."
      end
    end
  when "3"
    found = false
    while !found
      puts "Which repository would you like to star?"
      repo = Repository.find_by(name: gets.chomp)
      if repo
         current_user.star_repo(repo)
         found = true
      else
        puts "Repository not found."
      end
    end
  when "4"
    found = false
    while !found
      puts "Which user would you like to follow? Please enter a username"
      user = User.find_by(username: gets.chomp)
      if user
        current_user.follow_user(user.username)
        found = true
      else
        puts "Username not found."
      end
    end
  when "exit"
    return
  else
    puts "Please enter a valid choice."
  end
end # end create_menu

def update_menu(current_user)
  # system "clear" or system "cls"

  puts "What are we updating today? Exit to exit"
  puts "1. User"
  puts "2. Repository"
  update_input = gets.chomp

  case update_input
  when "1"
    puts "What attribute would you like to update?"
    puts "1. Name"
    puts "2. Username"
    puts "3. Email"
    attribute_input = gets.chomp
    case attribute_input
    when "1"
      name = ask("Name: ")
      current_user.update(name: name)
    when "2"
      username = ask("Username: ")
      current_user.update(username: username)
    when "3"
      email = ask("Email: ")
      current_user.update(email: email)
    else
      "Not a valid attribute"
    end
  when "2"
    puts "What repository are you looking to change"
    repo_name = gets.chomp
    repo = Repository.find_by(name: repo_name)
    if repo
      puts "What would you like to rename it?"
      new_name = gets.chomp
      repo.update(name: new_name)
    else
      puts "Repo does not exist"
    end
  when "exit"
    return
  else
    puts "Invalid choice."
  end
end # end update_menu
