require 'rails_helper'

RSpec.feature 'InventoryFoods', type: :feature do
  before(:each) do
    @user = User.new(name: 'Test User', email: 'example@gmail.com', password: 'password')
    @food = Food.new(name: 'Test Food', measurement_unit: 'kilo', price: 15, user: @user)
    @inventory = Inventory.new(name: 'Test Inventory', user: @user)
    @inventory_food = InventoryFood.new(food: @food, quantity: 20, inventory: @inventory)
  end

  it 'belongs to a user' do
    expect(@inventory_food.food_id).to eq(@user.id)
  end

  it 'belongs to an inventory' do
    expect(@inventory_food.inventory).to eq(@inventory)
  end

  it 'belongs to a food' do
    expect(@inventory_food.food).to eq(@food)
  end

  it 'has a quantity' do
    expect(@inventory_food.quantity).to eq(20)
  end
end
