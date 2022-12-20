class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.all.page(params[:page]).order(created_at: :desc).per(5).includes(:user, :favorites)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
    @private = Recipe.order(created_at: :desc).first
  end

  def create
    @recipe = Recipe.new(recipe_params)
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
    if @recipe.update(recipe_update)
      redirect_to recipe_path(@recipe.id)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to account_path(current_user), flash: { info: "レシピを削除しました。"}
  end

  def release
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :main_food, :food, :recipe_how, :material, :price, :time, :user_id)
  end

  def recipe_update
    params.require(:recipe).permit(:recipe_name, :main_food, :food, :recipe_how, :material, :price, :time)
  end
end
