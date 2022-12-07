class FavoritesController < ApplicationController
  def create
    @user = current_user
    @recipes = Recipe.all.page(params[:page]).order(created_at: :desc).per(5).includes(:user, :favorite)
    favorite = Favorite.create(favorite_params)
    redirect_to recipes_path
  end

  def destroy
    if favorite = Favorite.find_by(favorite_params)
      favorite.destroy
    end
    redirect_to recipes_path
  end

  private
  def favorite_params
    { recipe_id: params[:recipe_id], user_id: current_user.id }
  end
end
