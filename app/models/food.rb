class Food < ApplicationRecord
  belongs_to :user
  has_many :inventoryFoods, dependent: :destroy
  has_many :recipeFoods, dependent: :destroy
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than: 0 }
end
