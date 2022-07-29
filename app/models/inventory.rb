class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventoryFoods, dependent: :destroy
end
