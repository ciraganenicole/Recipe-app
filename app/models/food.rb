class Food < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true, length: { maximum: 250 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods
end
