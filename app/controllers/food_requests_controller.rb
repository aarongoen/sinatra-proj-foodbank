class FoodRequestsController < ApplicationController

# CREATE
    # New
    get '/food_requests/new' do
        if Helpers.is_logged_in?(session)
            # binding.pry
            @user = Helpers.current_user(session)
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
            binding.pry
            food_request.user_id= current_user.id
            food_request.save
            # binding.pry
            redirect '/food_requests'

        #     food_request = FoodRequest.new(params[:food_request])
        # if !food_request.name.empty? 
        #     params[:food_request].each do |details|
        #         FoodRequest.new(details)
        #         food_request.user_id= current_user.id
        #         food_request.save
        #     end
        # redirect '/food_requests'
        else 
            @error = "Data invalid. Please try again."
            erb :'/food_requests/new'
        end
    end

# READ

    # Index
        get '/food_requests' do
            # if @user = User.find_by(id: session[:id])

            if Helpers.is_logged_in?(session)
                # binding.pry
                @user = Helpers.current_user(session)

                @food_requests = FoodRequest.all.reverse

                @user_food_requests = @user.food_requests
                erb :'/food_requests/index'
            else
                redirect '/sessions/login'
            end
        end

    # Show
        get '/food_requests/:id' do

            if Helpers.is_logged_in?(session)
                @user = Helpers.current_user(session)
                @food_request = FoodRequest.find(params["id"])
                erb :'/food_requests/show'
            else
                redirect '/sessions/login'
            end
        end

# UPDATE

    # Edit
        get '/food_requests/:id/edit' do
            @food_request = FoodRequest.find(params[:id])
            erb :'/food_requests/edit'
        end

    # Update
        patch '/food_requests/:id' do
            @food_request = FoodRequest.find(params[:id])
            if !params["food_request"]["name"].empty? && !params["food_request"]["quantity"].empty? 
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
