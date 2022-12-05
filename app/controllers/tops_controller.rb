class TopsController < ApplicationController
  before_action :search
  def index
    @user = current_user
    @recipe = Recipe.all.order(created_at: :desc).first(1)
  end

  def about
    @user = current_user
  end

  def search
    @user = current_user
    @search = Recipe.ransack(params[:q])
    @results = @search.result.order("created_at DESC").page(params[:page]).per(10)
    @counts = @results.all.count
    @search = Recipe.ransack
  end
end
