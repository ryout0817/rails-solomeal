class RecipesController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @user = current_user
  end

  def create
  end

  def show
  end
end
