class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def self.value(id)
    recipe_food = RecipeFood.find(id)
    Food.find(recipe_food.food_id).price * recipe_food.quantity
  end
end
