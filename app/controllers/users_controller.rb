class UsersController < ApplicationController

  get '/users/signup' do

    erb :'/users/signup'
  end

  post '/users/signup' do

    @user = User.new(params)
      if @user.username.empty? #|| @user.password.empty?
        @error = "You must enter a username and password. Please try again."
        erb :'/users/signup'
      elsif User.find_by(username: @user.username) 
        @error = "This username is taken. Please try again."
        erb :'/users/signup' 
      else 
        @user.save
        # binding.pry
        session[:id] = @user.id
        @user
        redirect "/food_requests"
      end
  end

  end
  