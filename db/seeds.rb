# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef1 = Chef.create(name: "Gordon Ramsay")
chef2 = Chef.create(name: "Martha Stewart")
chef3 = Chef.create(name: "Rachel Ray")
dish1 = Dish.create(name: "Carbonara", description: "Its great pasta!", chef_id: chef1.id)
dish2 = Dish.create(name: "Mac and Cheese", description: "Its the most perfect mac and cheese ever!", chef_id: chef2.id)
dish3 = Dish.create(name: "Smoky Sloppy Joes Nachos", description: "Perefect combination between sloppy joes and nachos!", chef_id: chef3.id)
ingredient1 = Ingredient.create(name: "Spaghetti", calories: 50)
ingredient2 = Ingredient.create(name: "Peas", calories: 15)
ingredient3 = Ingredient.create(name: "Elbow Macaroni", calories: 100)
ingredient4 = Ingredient.create(name: "White Chedar Cheese", calories: 150)
ingredient5 = Ingredient.create(name: "Bacon", calories: 200)
ingredient6 = Ingredient.create(name: "Tortilla Chips", calories: 110)
DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient3.id)
DishIngredient.create(dish_id: dish2.id, ingredient_id: ingredient4.id)
DishIngredient.create(dish_id: dish3.id, ingredient_id: ingredient5.id)
DishIngredient.create(dish_id: dish3.id, ingredient_id: ingredient6.id)