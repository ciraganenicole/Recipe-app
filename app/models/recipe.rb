class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
end
