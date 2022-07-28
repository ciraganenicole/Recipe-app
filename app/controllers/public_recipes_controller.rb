class PublicRecipesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]
  def index
    # @public_recipe_data = []
    @public_recipes = Recipe.where(public: true).order('created_at DESC')
    # public_recipes.each do |recipe|
    #   public_recipe_data_unit = {}
    #   public_recipe_data_unit[:recipe] = recipe
    #   public_recipe_data_unit[:food_count] = recipe.foods.length
    #   public_recipe_data_unit[:total_price] = recipe.recipe_foods.reduce(0) do |total_price, recipe_food|
    #     total_price + (recipe_food.food.price * recipe_food.quantity)
    #   end
    #   @public_recipe_data << public_recipe_data_unit
    # end
  end
end
