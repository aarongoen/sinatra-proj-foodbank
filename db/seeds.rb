# Add seed data here. Seed your database with `rake db:seed`
max = User.create(username: "Max", password: "hungry")
cameron = User.create(username: "Cameron", password: "thirsty")

milk = FoodRequest.create(name: "milk", quantity: 1, measuring_unit: "gallon")
mac_and_cheese = FoodRequest.create(name: "macaroni and cheese", quantity: 2, measuring_unit: "boxes")