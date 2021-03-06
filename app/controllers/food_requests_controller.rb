class FoodRequestsController < ApplicationController

# CREATE
    # New
    get '/food_requests/new' do
        if logged_in?
            erb :'/food_requests/new'
        else
            @error = "You must log in first."
            erb :'/sessions/login'
        end
    end

    # Create
    post '/food_requests' do
        food_request = FoodRequest.new(params)

        if !food_request.name.empty? 
            food_request.user_id = current_user.id
            food_request.save
            redirect '/food_requests'
        else 
            @error = "Data invalid. Please try again."
            erb :'/food_requests/new'
        end
    end

# READ

    # Index
        get '/food_requests' do
            # @user = User.find_by(id: session[:id])
            if logged_in?
                @food_requests = current_user.food_requests
                erb :'/food_requests/index'
            else
                redirect '/sessions/login'
            end
        end

    # Show
        get '/food_requests/:id' do
            @food_request= current_user.food_requests.find_by(id: params["id"])
            if @food_request 
                erb :'/food_requests/show'
            else
                redirect '/food_requests'
            end
        end

# UPDATE

    # Edit
        get '/food_requests/:id/edit' do
            @food_request= current_user.food_requests.find_by(id: params["id"])
            if @food_request 
                erb :'/food_requests/edit'
            else
                @error = "You must be logged in to edit this request."
                redirect '/sessions/login'
            end
        end

    # Update
        patch '/food_requests/:id' do
            @food_request= current_user.food_requests.find_by(id: params["id"])
            if @food_request && !params["food_request"]["name"].empty? && !params["food_request"]["quantity"].empty? 
                @food_request.update(params["food_request"])
                redirect "/food_requests/#{params[:id]}"
            else
                @error = "Item(s) must have a name and quantity. Please try again."
                erb :'/food_requests/edit'
            end
        end
    
# DELETE

    # Destroy
        delete '/food_requests/:id' do
            food_request = FoodRequest.find(params[:id])
            food_request.destroy
            redirect '/food_requests'
        end
end
