class ApplicationController < ActionController::Base
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
    # 新規登録時にnicknameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 情報更新時にnicknameの取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
