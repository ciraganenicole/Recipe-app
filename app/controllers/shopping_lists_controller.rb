class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.includes(:foods).find(params[:recipe_id])
    @inventory = Inventory.includes(:foods).find(params[:inventory_id])
    @all_foods = []
    p @all_foods
    @recipe.foods.each do |recipe_food|
      @inventory.foods.each do |inventory_food|
        @all_foods.push(recipe_food) unless recipe_food.name == inventory_food.name
        p recipe_food.recipe_foods.where(food_id: recipe_food.id).pluck('quantity')
      end
    end
    @food_count = @all_foods.length
    @total_price = @all_foods.reduce(0) { |total, food| total + food[:price] }
  end
end
