class TopsController < ApplicationController
  def index
    @user = current_user
  end

  def about
    @user = current_user
  end

  def guest_sign_in
    user = User.find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
    sign_in user
    redirect_to "/", flash: {info:'ゲストとしてログインしました。'}
  end
end
