class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :introduction, :recommended_dishes, :avatar))
      redirect_to account_path(@user)
    else
      render "edit"
    end
  end

  def withdrawal
    @user = current_user
  end
end
