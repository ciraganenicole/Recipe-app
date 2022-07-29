class RecipesController < ActionController::Base
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipeFoods.all
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  def create
    @user = current_user
    recipe = @user.recipes.new(recipe_params)
    respond_to do |format|
      format.html do
        if recipe.save
          flash[:success] = 'Recipe created successfully'
          redirect_to recipes_url
        else
          flash.now[:error] = 'Error: Recipe could not be created'
          render :new
        end
      end
    end
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipe_path
    flash[:success] = 'Recipe was deleted!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :public, :description)
  end
end
