class FavoritesController < ApplicationController
  def create
    Favorite.create(favorite_params)
    @recipe = Recipe.find(params[:recipe_id])
    redirect_back(fallback_location: "/")
  end

  def destroy
    if favorite = Favorite.find_by(favorite_params)
      favorite.destroy
    end
    @recipe = Recipe.find(params[:recipe_id])
    redirect_back(fallback_location: "/")
  end

  private
  def favorite_params
    { recipe_id: params[:recipe_id], user_id: current_user.id }
  end
end
