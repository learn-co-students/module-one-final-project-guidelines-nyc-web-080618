require 'bundler'
require "bundler/setup"
require 'yaml'
require 'active_record'
require 'rake'
require 'yaml/store'
require 'ostruct'
require 'date'
require 'faker'
require 'terminal-table'


Bundler.require


DBNAME = "artistevents"


Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require 'bundler/setup'
Bundler.require
