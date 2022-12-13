# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(name: "加藤 響", email: 'example@test.com', password: '111111', introduction: "よろしくお願いします、朝食に簡単な料理を作ります。",avatar:  File.open("./app/assets/images/IMG_4882.jpeg"))
user.save!

recipe = Recipe.new(recipe_name: "[材料少なめで作りやすい!]チャーハン", main_food: "卵", price: 400, time: 10, user_id: 1, material: "1. 卵 1個", food: File.open("./app/assets/images/25095400_m.jpg"))
recipe.save!
