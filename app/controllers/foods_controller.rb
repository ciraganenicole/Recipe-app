class FoodsController < ActionController::Base
  def index
    @foods = Food.all
  end

  def new
    @user = current_user
    food = @user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if food.save
          flash[:success] = 'Food created successfully'
          redirect_to foods_path
        else
          flash.now[:error] = 'Error: Food could not be created'
          render :new
        end
      end
    end
  end

  def destroy
    @user = current_user
    @food = @user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_path
    flash[:success] = 'Food was deleted!'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
