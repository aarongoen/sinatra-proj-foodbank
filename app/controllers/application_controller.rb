require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #Gives the client the ability to log in.
    set :session_secret, "password_security"
  end

  get "/" do #GET request action whose method is the route '/'. It directs the client to the ':welcome' view.
    erb :welcome
  end
  
  helpers do #Methods to verify the client is logged in by checking to see if the user's id is in the session id.
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(:id => session[:user_id])
    end
end

  
end
