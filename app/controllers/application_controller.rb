require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :home_page
  end

  post "/signup" do
    # binding.pry
    user = User.new(name: params["name"], password: params["password"])
    session[:id] = user.id
    erb :user_home
  end
  #   if user
  #     # binding.pry
	# 		redirect "/login"
	# 	else
	# 		redirect "/failure"
  #   end
  #   erb :sign_up
	# end

  get '/sessions/login' do

    erb :'sessions/login'
  end

  post '/sessions/login' do
    @user = User.find_by(name: params[:name], password: params[:password])
    if user && user.authenticate(params[:password])
			session[:user_id] = user.id	
			redirect "registrations/success"
		else
			redirect "registrations/failure"
		end
  end

  get "/success" do
		if logged_in?
			erb :success
		else
			redirect "sessions/login"
		end
  end

  get "/failure" do
		erb :failure
	end
  
  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get '/users/home' do

    @user = User.find(session[:user_id])
    erb :'/users/home'
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

end
