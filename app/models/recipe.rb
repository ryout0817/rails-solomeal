class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploader :food, FoodUploader

  validates :recipe_name, presence: true, length: { in: 1..20 }
  validates :main_food, presence: true
  validates :time, presence: :true
  validates :price, presence: :true
end
