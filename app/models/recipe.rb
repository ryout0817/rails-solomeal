class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  mount_uploader :food, FoodUploader

  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options presence: true do
    validates :recipe_name, length: { in: 1..20 }
    validates :main_food, format: { with: VALID_PASSWORD_REGEX, flash: { info: 'は半角英数を両方含む必要があります'} }
    validates :time
    validates :price
  end

  def self.search(search)
    if search == ""
      redirect_to serach_recipes_path
    else
      Recipe.where(['recipe_name LIKE(?) OR main_food LIKE(?)', "%#{search}%", "%#{search}%"]).order('created_at DESC')
    end
  end
end
