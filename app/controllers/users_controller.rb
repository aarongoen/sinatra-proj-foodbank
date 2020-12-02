class UsersController < ApplicationController

  get '/users/signup' do

    erb :'/users/signup'
  end

  post '/users/signup' do

    @user = User.new(params)
      if @user.username == "" || @user.password == ""
        @error = "You must enter a username and password. Please try again."
        erb :'/users/signup'
      elsif User.find_by(username: @user.username) 
        @error = "This username is taken. Please login or try again."
        erb :'/users/signup' 
      else 
        @user.save
        session[:user_id] = @user.id
        # binding.pry

        erb :'/food_requests/index'
      end
  end

  end
  