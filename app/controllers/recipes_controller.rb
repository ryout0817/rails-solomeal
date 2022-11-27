class RecipesController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @user = current_user
    @recipe = Recipe.new
    @private = Recipe.order(created_at: :desc).first
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:recipe_name, :recipe_introduction, :time, :user_id))
    if @recipe.save
      redirect_to edit_recipe_path(@recipe)
    else
      redirect_to new_recipe_path
    end
  end

  def show
  end

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end
end
