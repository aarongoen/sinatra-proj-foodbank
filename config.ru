require './config/environment' #uses the files in said folder.

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' #Error message.
end

use Rack::MethodOverride #Middleware which allows PATCH and DELETE requests.
use UsersController
use SessionsController
use FoodRequestsController
run ApplicationController #With the previous few lines, it starts the application.
