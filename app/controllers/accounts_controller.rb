class AccountsController < ApplicationController
  before_action :authenticate_user!, except: [:release]
  before_action :search
  def show
    @user = current_user
    @recipes = current_user.recipes.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if !(@user.name == "ゲスト") && @user.update(params.require(:user).permit(:name, :introduction, :recommended_dishes, :avatar))
      redirect_to account_path(@user)
    else
      redirect_to "/", flash: { info: "ゲストユーザーは編集することができません。"}
    end
  end

  def withdrawal
    @user = current_user
  end

  def release
    @user = current_user
    @release_user = User.find(params[:id])
    @recipes = @release_user.recipes.order(created_at: :desc)
  end
end
