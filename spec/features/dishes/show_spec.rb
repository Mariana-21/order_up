require "rails_helper"

RSpec.describe "As a visitor", type: :feature do 
  describe "When I visit a dish's show page" do 
    it "I see a list of ingredients for that dish " do
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

      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name) 
      expect(page).to have_content(ingredient1.name) 
      expect(page).to have_content(ingredient2.name) 
      expect(page).to have_content(chef1.name) 
      expect(page).to_not have_content(dish2.name)
      save_and_open_page
    end
  end
end
# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name
