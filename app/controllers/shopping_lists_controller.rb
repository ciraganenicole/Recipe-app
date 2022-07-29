class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.includes(:foods).find(params[:recipe_id])
    @inventory = Inventory.includes(:foods).find(params[:inventory_id])
    @all_foods = current_user
      .recipes
      .includes([:recipe_foods])
      .joins('INNER JOIN recipe_foods ON recipe_foods.recipe_id = recipes.id')
      .joins('INNER JOIN foods ON recipe_foods.food_id = foods.id')
      .select("foods.name as name,
                foods.measurement_unit as measurement_unit,
                sum(recipe_foods.quantity) as quantity,
                sum(foods.price * recipe_foods.quantity) as price")
      .group('foods.id')

    @food_count = @all_foods.length
    @total_price = @all_foods.reduce(0) { |total, food| total + food[:price] }
  end
end
