class TopsController < ApplicationController
  before_action :search
  def index
    @user = current_user
    @recipe = Recipe.all.order(created_at: :desc).first(1)
  end

  def about
    @user = current_user
  end
end
