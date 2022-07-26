class InventoriesController < ApplicationController
  def index
    @user = current_user
    @inventories = Inventory.all
  end

  def new
    @user = current_user
    @inventory = Inventory.new
  end

  def create
    @user = current_user
    unless @user.present?
      flash[:error] = 'Error: You have to sign in first!'
      redirect_to inventories_path
    end
    inventory = Inventory.new(inventory_params.merge(user: current_user))
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
    @user = current_user
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    @user = current_user
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
