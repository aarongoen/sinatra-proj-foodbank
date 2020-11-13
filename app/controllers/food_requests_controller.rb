class FoodRequestsController < ApplicationController

# CREATE
    # New
    # Make a GET request to '/food_requests/new'
    get '/food_requests/new' do
        erb :'/food_requests/new'
    end

    # Create
    # Make a POST request to '/food_requests'
    post '/food_requests' do
        # binding.pry
        food_request = FoodRequest.new(params)
        if !food_request.name.empty? 
            food_request.user_id= current_user.id
            food_request.save
            redirect '/food_requests'

        #     food_request = FoodRequest.new(params[:food_request])
        # if !food_request.name.empty? 
        #     params[:food_request].each do |details|
        #         FoodRequest.new(details)
        #         food_request.user_id= current_user.id
        #         food_request.save
        #     end
    
            redirect '/food_requests'
        else 
            @error = "Data invalid. Please try again."
            erb :'/food_requests/new'
        end
    end

# READ

    # Index
        # Make a GET request to '/food_requests'

        get '/food_requests' do
            if @user = User.find_by(id: session[:id])
                @food_requests = FoodRequest.all.reverse

                @user_food_requests = @food_requests.select do |r|
                    r.user_id == @user.id
                    # binding.pry
                end
                
                erb :'/food_requests/index'
            else
                redirect '/sessions/login'
            end
        end

    # Show
        # Make a GET request to '/food_requests/:id'
        get '/food_requests/:id' do
            @food_request = FoodRequest.find(params["id"])
            erb :'/food_requests/show'
        end

# UPDATE

    # Edit
        # Make a GET request to '/recipes/:id/edit'
        get '/food_requests/:id/edit' do
            @food_request = FoodRequest.find(params[:id])
            erb :'/food_requests/edit'
        end

    # Update
        # Make a PATCH request to '/food_requests/:id'
        patch '/food_requests/:id' do
            # binding.pry
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
        # Make a DELETE request to '/food_requests/:id'
        delete '/food_requests/:id' do
            food_request = FoodRequest.find(params[:id])
            # binding.pry
            food_request.destroy
            redirect '/food_requests'
        end
end
