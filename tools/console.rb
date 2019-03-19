require_relative '../config/environment.rb'

zach = User.new("zach")
ben = User.new("ben")
alex = User.new("alex")
cookies = Recipe.new("cookies")
bread = Recipe.new("bread")
apple = Recipe.new("apples")
wheat = Recipe.new("wheat")
tomato = Recipe.new("food")

zach.add_recipe_card(2, 3, cookies)
zach.add_recipe_card(4, 5, bread)
zach.add_recipe_card(6, 6, apple)
zach.add_recipe_card(2, 8, wheat)
zach.add_recipe_card(1, 2, tomato)

cookies.add_ingredient(["bread"])
apple.add_ingredient(["apples"])

zach.declare_allergen("bread")
ben.declare_allergen("bread")
alex.declare_allergen("apples")

puts Ingredient.most_common_allergen

binding.pry
