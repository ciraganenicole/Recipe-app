class Food < ApplicationRecord
  has_many :inventories, through: :inventory_foods
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }
end
