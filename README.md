# FlatHub

FlatHub is a Command Line Interface that simulates GitHub. It does not connect to the GitHub API but that could be added later. FlatHub is a CRUD app. Here is a list of actions you can perform:
* Create a user
* Create a repository
* Fork/Unfork repositories
* Follow/Unfollow users
* Star/unstar repositories

### Installation

After cloning the repository, you'll have to
* Install bundle if you do not have it yet. In your console run
```console
gem install bundle
```
* Then install the gems required by this project
```console
bundle
```
* Create our database by running our migration files
```console
rake db:migrate
```
* Seed the database to have some dummy data
```console
rake db:seed
```
* Run the app
```console
ruby bin/run.rb
```

### Contributing
Fork the repo, make some changes and submit a pull request. These changes can be anything as long as they help contribute to the overall reason for the app, which is the be a clone of GitHub. Please make the reason for the pull descriptive.  

### [License](LICENSE.md)
