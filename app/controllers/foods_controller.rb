class FoodsController < ApplicationController
  before_action do
    authenticate_user!
    @user = current_user
  end

  def index
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new(food_params.merge(user: @user))
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
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
    flash[:success] = 'Food was deleted!'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
