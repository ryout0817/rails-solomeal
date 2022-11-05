class ApplicationController < ActionController::Base
  # deviseのコントローラを使う前に呼ばれるアクション
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_sign_up_params
    edit_user_registration_path(@user.id)
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path(@user.id)
  end

  def after_sign_in_path_for(resource)
    edit_user_registration_path
  end

  def configure_permitted_parameters
    # 新規登録時にnameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # ログイン時にnemeを取得を許可
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # 情報更新時にnameの取得許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
