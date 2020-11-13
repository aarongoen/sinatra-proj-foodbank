class SessionsController < ApplicationController


      # get 'users/user_home' do
      #   # binding.pry
      #   @user = session[:id] = @session
        
      # erb :'/users/user_home'
      # end
      #   if user
      #     # binding.pry
        # 		redirect "/login"
        # 	else
        # 		redirect "/failure"
      #   end
      #   erb :sign_up
        # end
    get '/sessions/login' do
      erb :'/sessions/login'
    end
    
    post '/sessions/login' do
          # binding.pry  
          @user = User.find_by(username: params["username"])

          if params["username"].empty? || params["password"].empty?
            @error = "You must enter a username and password. Please try again."
            erb :'/sessions/login'
          elsif
            @user && @user.authenticate(params[:password]) 
            # binding.pry
            session[:id] = @user.id
            redirect "/food_requests"
          elsif
            !@user.authenticate(params[:password])
            @error = "Incorrect password"
            erb :'/sessions/login'
          else
            # binding.pry
            @error = "Account not found."
            erb :'/sessions/login'
          end


      # @user = User.find_by(name: params[:name], password: params[:password])
      # if user && user.authenticate(params[:password])
      #         session[:user_id] = user.id	
      #         redirect "/sessions/success"
      #     else
      #         redirect "/sessions/failure"
      #     end
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
