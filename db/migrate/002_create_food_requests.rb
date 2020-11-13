class CreateFoodRequests < ActiveRecord::Migration
    def change 
        create_table :food_requests do |t|
            t.string :name
            t.integer :quantity
            t.string :measuring_unit
            t.integer :user_id
        end
    end
end