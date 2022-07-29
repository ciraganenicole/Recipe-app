class InventoryFoodsController < ApplicationController
  before_action do
    authenticate_user!
    @inventory = Inventory.find(params[:inventory_id])
  end

  def new
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = InventoryFood.new(inventory_food_params.merge(inventory: @inventory))
    respond_to do |format|
      format.html do
        if @inventory_food.save
          flash[:success] = 'Food saved succesfully'
          redirect_to inventory_path(@inventory)
        else
          flash[:error] = 'Error: Food could not be saved'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(@inventory_food.inventory), notice: 'Food Successfully deleted'
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
