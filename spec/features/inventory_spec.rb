require 'rails_helper'
RSpec.feature 'Inventories', type: :feature do
  before(:each) do
    @user = User.new(name: 'Test User', email: 'example@gmail.com', password: 'password')
    @inventory = Inventory.new(name: 'Test Inventory', user: @user)
  end

  it 'belongs to a user' do
    expect(@inventory.user).to eq(@user)
  end

  it 'has a name' do
    expect(@inventory.name).to eq('Test Inventory')
  end

  it 'has many inventory_foods' do
    expect(@inventory).to respond_to(:inventory_foods)
  end
end
