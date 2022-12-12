class TopsController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.all.order(created_at: :desc).first(1)
    @recipe_rank = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end

  def about
    @user = current_user
  end
end
