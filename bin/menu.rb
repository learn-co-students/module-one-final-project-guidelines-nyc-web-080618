require 'tty-prompt'

def read_menu(current_user)
  prompt = TTY::Prompt.new
  # system "clear" or system "cls"
  puts "What info would you like to get"
  choices = [
    'Read a user',
    'Read a repository',
    'Read your repositories',
    'Read your forked repositories',
    'Read users that forked your repositories',
    'Read your starred repositories',
    'Search your repositories by language',
    'See your followers',
    'See users you follow',
    'Exit'
  ]
  read_input = prompt.select('What information do you want?', choices, cycle: true, per_page: 10)

  case read_input
  when "Read a user"
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
  when "Read a repository"
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
  when "Read your repositories"
    puts "Here are your repositories..."
    current_user.repositories.each_with_index do |my_repo, i|
      puts "#{i+1}. #{my_repo.name}"
    end
  when "Read your forked repositories"
    puts current_user.forks
  when "Read users that forked your repositories"
    puts current_user.users_that_forked_our_repos
  when "Read your starred repositories"
    current_user.my_starred_repositories
  when "Search your repositories by language"
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
  when "See your followers"
    puts current_user.my_followers
  when "See users you follow"
    puts current_user.users_i_follow
  when "Exit"
    return true
  else
    puts "Invalid choice."
  end
end # end create_menu

def create_menu(current_user)
  # system "clear" or system "cls"
  prompt = TTY::Prompt.new
  puts "What are we doing today? Exit to exit"
  choices = [
    'Create Repository',
    'Fork Repository',
    'Star Repository',
    'Follow User',
    'Exit'
  ]
  create_name_input = prompt.select('What are we creating?', choices, cycle: true, per_page: 5)

  case create_name_input
  when "Create Repository"
    puts "Repository name: "
    current_user.create_repo(gets.chomp)
    current_user.reload
  when "Fork Repository"
    found = false
    while !found
      puts "Repository name: "
      create_name_input = gets.chomp
      repo = Repository.find_by(name: create_name_input)
      if repo
        current_user.fork_repo(repo)
        current_user.reload
        found = true
      else
        puts "Repository not found."
      end
    end
  when "Star Repository"
    found = false
    while !found
      puts "Which repository would you like to star?"
      repo = Repository.find_by(name: gets.chomp)
      if repo
         current_user.star_repo(repo)
         current_user.reload
         found = true
      else
        puts "Repository not found."
      end
    end
  when "Follow User"
    found = false
    while !found
      puts "Which user would you like to follow? Please enter a username"
      user = User.find_by(username: gets.chomp)
      if user
        current_user.follow_user(user.username)
        current_user.reload
        found = true
      else
        puts "Username not found."
      end
    end
  when "Exit"
    return
  else
    puts "Please enter a valid choice."
  end
end # end create_menu

def update_menu(current_user)
  # system "clear" or system "cls"
  prompt = TTY::Prompt.new
  puts "What are we updating?"
  choices = [
    'User',
    'Repository',
    'Exit'
  ]

  update_input = prompt.select('What are we creating?', choices, cycle: true, per_page: 5)

  case update_input
  when "User"
    user_prompt = TTY::Prompt.new
    user_choices = [
      'Name',
      'Username',
      'Email',
      'Exit'
    ]
    attribute_input = user_prompt.select('What attribute are we updating?', user_choices, cycle: true)
    case attribute_input
    when "Name"
      name = ask("Name: ")
      current_user.update(name: name)
    when "Username"
      username = ask("Username: ")
      current_user.update(username: username)
    when "Email"
      email = ask("Email: ")
      current_user.update(email: email)
    when "Exit"
      return
    else
      "Not a valid attribute"
    end
  when "Repository"
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
  when "Exit"
    return
  else
    puts "Invalid choice."
  end
end # end update_menu

def delete_menu(current_user)
  prompt = TTY::Prompt.new

  choices = [
    'User',
    'Repository',
    'Unfollow User',
    'Unstar Repository',
    'Exit'
  ]
  delete_input = prompt.select("What are we deleting?", choices, cycle: true)

  case delete_input
  when "User"
    puts "It was nice knowing you, goodbye."
    current_user.destroy
    return
  when "Repository"
    puts "Repository name?"
    find_repo = Repository.find_by(name: gets.chomp)
    user_repo = current_user.user_repositories.find_by(forked: false, repository_id: find_repo.id)
    if user_repo
      repo = user_repo.repository
      repo.destroy
      current_user.reload
    else
      "Repository not found"
    end
  when "Unfollow User"
    puts "Who are you unfollowing?"
    user = User.find_by(username: gets.chomp)
    if user
      current_user.followers.where(follower_id: current_user.id, followee_id: user.id).destroy
      current_user.reload
    else
      puts "You don't follow that user."
    end
  when "Unstar Repository"
    puts "Repository name?"
    repo = Repository.find_by(name: gets.chomp)
    if repo
      current_user.stars.where(starred_repository_id: repo.id).destroy
      current_user.reload
    else
      puts "You don't star that repo."
    end
  when "Exit"
    return
  else
    "Invalid choice"
  end

end
