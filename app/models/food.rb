class Food < ApplicationRecord
  belongs_to :user
  has_many :inventories, through: :inventory_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy
  has_many :recipe_foods
  has_many :inventory_foods

  validates :name, presence: true, length: { maximum: 250 }
end
