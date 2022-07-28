class Food < ApplicationRecord
  belongs_to :user
  has_many :inventories, through: :inventory_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
end
