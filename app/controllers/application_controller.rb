class ApplicationController < ActionController::Base
  private
  def configure_sign_up_params
    edit_user_registration_path(@user.id)
  end
  def after_sign_up_path_for(resource)
    edit_user_registration_path(@user.id)
  end
end
