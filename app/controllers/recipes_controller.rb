class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.all.order(created_at: :desc).includes(:user)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
    @private = Recipe.order(created_at: :desc).first
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:recipe_name, :main_food, :food, :recipe_how, :material, :price, :time, :user_id))
    if @recipe.save
      redirect_to recipes_path
    else
      redirect_to new_recipe_path, flash: { info: "入力ミスがあります。"}
    end
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params.require(:recipe).permit(:recipe_name, :main_food, :food, :recipe_how, :material, :price, :time))
      redirect_to recipes_path(@recipe.id)
    else
      render 'edit'
    end
  end

  def release
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end
end
