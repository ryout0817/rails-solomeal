require 'rails_helper'

RSpec.describe "Users" do
  context "ログイン" do
    let!(:user) {FactoryBot.create(:user)}
    before do
      visit user_session_path
    end

    it "アカウント登録押下後の遷移を確認" do
      within (".content-document-inner") do
        expect(page).to have_content "アカウント登録"
        click_link "アカウント登録"
        expect(page).to have_current_path new_user_registration_path
      end
    end

    it "入力フォームに入力後、ログイン成功" do
      fill_in "user[email]",	with: user.email
      fill_in "user[password]", with: user.password

      click_button "ログイン"
      expect(page).to have_current_path account_path(user.id)
    end

    it "ログイン失敗" do
      fill_in "user[email]",	with: ""
      fill_in "user[password]", with: ""

      click_button "ログイン"
      expect(page).to have_current_path user_session_path
    end
  end
end
