class GenerateShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.all
    @recipe_id = params[:recipe_id]
  end
end
