class RecipesController < ApplicationController
  before_action do
    # No current_user for now
    @user = current_user
    unless @user.present?
      flash[:error] = 'You are not signed in, sign in to continue!'
      redirect_to new_user_session_path
    end
  end

  def index
    @recipes = @user.recipes
  end

  def new
    @recipe = Recipe.new
    p params[:recipe]
  end

  def create
    recipe = Recipe.new(recipe_params.merge(user: @user))
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
    params.require('recipe').permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
