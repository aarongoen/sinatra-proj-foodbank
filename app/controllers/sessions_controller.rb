class SessionsController < ApplicationController

    get '/sessions/login' do
      if logged_in?
        redirect to '/food_requests'
      else
      erb :'/sessions/login'
      end
    end
    
    post '/sessions/login' do
      @user = User.find_by(username: params[:username])
      # binding.pry
          if params["username"].empty? || params["password"].empty?
            @error = "You must enter a username and password. Please try again."
            erb :'/sessions/login'
          elsif 
            # binding.pry
            @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            # binding.pry
            erb :'/food_requests/index'
          elsif 
            # binding.pry
            !@user.authenticate(params[:password])
            @error = "Incorrect password"
            erb :'/sessions/login'
          else
            @error = "Account not found."
            erb :'/sessions/login'
          end

    end
    
      # get "/success" do
        # 	if logged_in?
        # 		erb :success
        # 	else
        # 		redirect to :login
        # 	end
      # end
    
      # get "/failure" do
        # 	erb :failure
        # end
      
      # # GET: /users
      # get "/users" do
      #   erb :"/users/index.html"
      # end
    
      get '/sessions/logout' do
        session.clear
        redirect '/'
      end

end
