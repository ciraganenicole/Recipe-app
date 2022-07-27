class User < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :name, presence: true
end
