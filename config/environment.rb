ENV['SINATRA_ENV'] ||= "development" #?If there's no instance of the Sinatra environment, it creates one.

require 'bundler/setup' #Makes sure that the bundler code gets used.
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection( #connects ActiveRecord to the database, using sqlite3.
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller' #Makes sure all of the controllers and the rest of the code is used.
require_all 'app'
