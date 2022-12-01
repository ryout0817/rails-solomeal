class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploader :food, FoodUploader

  validates :recipe_name, presence: true, length: { in: 1..20 }
  validates :price, presence: true
  validates :people, presence: true
  validates :main_food, presence: true
end
