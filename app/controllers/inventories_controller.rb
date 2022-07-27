class InventoriesController < ApplicationController
  before_action do
    @user = User.first
  end

  def index
    @inventories = @user.Inventories.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    inventory = Inventory.new(inventory_params.merge(user: @user))
    respond_to do |format|
      format.html do
        if inventory.save
          flash[:success] = 'New inventory created'
          redirect_to inventories_path
        else
          flash.now[:error] = 'Error: Inventory could not be created'
          render :new
        end
      end
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    inventory = Inventory.find(params[:id])
    inventory.destroy
    flash[:success] = 'Inventory successfully deleted'
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require('inventory').permit(:name)
  end
end
