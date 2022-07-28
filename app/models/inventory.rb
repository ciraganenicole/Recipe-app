class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }

  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :foods, through: :inventory_foods, dependent: :destroy
end
