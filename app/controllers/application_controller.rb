class ApplicationController < ActionController::Base
  # deviseのコントローラを使う前に呼ばれるアクション
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  private
  def configure_sign_up_params
    edit_user_registration_path(@user.id)
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path(@user.id)
  end

  def after_sign_in_path_for(resource)
    account_path(@user.id)
  end

  def configure_permitted_parameters
    # 新規登録時にnameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    # ログイン時にnemeを取得を許可
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # 情報更新時にnameの取得許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to "/", alert: "ゲストユーザーの編集・削除はできません。"
    end
  end

  def search
    # キーワード検索
    @user = current_user
    @search = Recipe.ransack(params[:q])
    @results = @search.result.order("created_at DESC").page(params[:page]).per(10)
    @counts = @results.all.count
    @search = Recipe.ransack
  end
end
