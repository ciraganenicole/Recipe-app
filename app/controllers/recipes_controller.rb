class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    current_user = User.first
    unless current_user.present?
      flash[:error] = 'Error: You have to sign in first!'
      redirect_to recipes_path
    end
    recipe = Recipe.new(recipe_params.merge(user: current_user))
    respond_to do |format|
      format.html do
        if recipe.save
          flash[:success] = 'New Recipe created'
          redirect_to recipes_path
        else
          flash.now[:error] = 'Error: Recipe could not be created'
          render :new
        end
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:success] = 'Recipe successfully deleted'
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require('recipe').permit(:name, :description, :cooking_time, :preparation_time)
  end
end
