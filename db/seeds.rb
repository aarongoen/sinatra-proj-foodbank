# Add seed data here. Seed your database with `rake db:seed`
max = User.create(name: "Max", age: 35, location: "Vons at the corner of Grand and 7th streets")
cameron = User.create(name: "Cameron", age: 18, location: "879 W. 8th Ave")

Food.create(name: "milk", quantity: 1, measuring_unit: "gallon")
Food.create(name: "macaroni and cheese", quantity: 2, measuring_unit: "boxes")