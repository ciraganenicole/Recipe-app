class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order('created_at DESC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
