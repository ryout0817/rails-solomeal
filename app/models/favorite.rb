class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :recipe_id, uniqueness: { scope: :user_id }

  def liked_by?(recipe_id)
    resipes.exists?(recipe_id: recipe_id)
  end
end
