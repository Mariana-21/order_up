require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a chef's show page" do 
    before (:each) do
      @chef1 = Chef.create(name: "Gordon Ramsay")
      @chef2 = Chef.create(name: "Martha Stewart")
      @chef3 = Chef.create(name: "Rachel Ray")
      @dish1 = Dish.create(name: "Carbonara", description: "Its great pasta!", chef_id: @chef1.id)
      @dish2 = Dish.create(name: "Mac and Cheese", description: "Its the most perfect mac and cheese ever!", chef_id: @chef2.id)
      @dish3 = Dish.create(name: "Smoky Sloppy Joes Nachos", description: "Perefect combination between sloppy joes and nachos!", chef_id: @chef3.id)
      @ingredient1 = Ingredient.create(name: "Spaghetti", calories: 50)
      @ingredient2 = Ingredient.create(name: "Peas", calories: 15)
      @ingredient3 = Ingredient.create(name: "Elbow Macaroni", calories: 100)
      @ingredient4 = Ingredient.create(name: "White Chedar Cheese", calories: 150)
      @ingredient5 = Ingredient.create(name: "Bacon", calories: 200)
      @ingredient6 = Ingredient.create(name: "Tortilla Chips", calories: 110)
      DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
      DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
      DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
      DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient5.id)
      DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient6.id)
    end
    it "I see the name of thaat chef and a link to all their ingredients"do 
      visit "/chefs/#{@chef1.id}"

      expect(page).to have_content(@chef1.name) 
      expect(page).to have_link("All Ingredients") 
    end

    it "When I click on that link I am taken to a chef's ingredient index page" do 
      visit "/chefs/#{@chef1.id}"

      click_link("All Ingredients")

      expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients") 
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to_not have_content(@ingredient4.name)
    end
  end
end


# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses