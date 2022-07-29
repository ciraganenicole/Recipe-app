class RecipeFoodsController < ActionController::Base
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe_food = @recipe.recipeFoods.create(recipe_params)
    respond_to do |format|
      format.html do
        if recipe_food.save
          flash[:success] = 'Food created successfully'
          redirect_to @recipe
        else
          flash.now[:error] = 'Error: Food could not be created'
          render :new
        end
      end
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(new_params)
      flash[:success] = 'Recipe Food updated successfully.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe
    flash[:success] = 'Food was deleted!'
  end

  private

  def recipe_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def new_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
