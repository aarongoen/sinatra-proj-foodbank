class UsersController < ApplicationController

    # GET: /user
    get "/user" do
      erb :"/user/index.html"
    end
  
    # GET: /user/new
    get "/user/new" do
      erb :"/user/new.html"
    end
  
    # POST: /user
    post "/user" do
      redirect "/user"
    end
  
    # GET: /user/5
    get "/user/:id" do
      erb :"/user/show.html"
    end
  
    # GET: /user/5/edit
    get "/user/:id/edit" do
      erb :"/user/edit.html"
    end
  
    # PATCH: /user/5
    patch "/user/:id" do
      redirect "/user/:id"
    end
  
    # DELETE: /user/5/delete
    delete "/user/:id/delete" do
      redirect "/user"
    end
  end
  