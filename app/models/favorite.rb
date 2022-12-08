class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates_uniqueness_of :recipe_id, scope: :user_id

  def liked_by?(recipe_id)
    resipes.where(recipe_id: recipe_id).exists?
  end
end
