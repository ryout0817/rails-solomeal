class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploader :food, FoodUploader

  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options presence: true do
    validates :recipe_name, length: { in: 1..20 }
    validates :main_food, format: { with: VALID_PASSWORD_REGEX, flash: { info: 'は半角英数を両方含む必要があります'} }
    validates :time
    validates :price
  end
end
