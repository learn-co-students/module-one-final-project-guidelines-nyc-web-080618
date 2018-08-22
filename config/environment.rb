require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'
require_all 'lib'
 #this is very important to connect ruby to SQL
