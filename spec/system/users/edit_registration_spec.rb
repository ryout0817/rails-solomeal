require 'rails_helper'

RSpec.describe "Users" do
  context "新規登録" do
    before do
      visit new_user_registration_path
    end

    it "コンテンツ確認"do
      within (".content-document-inner") do
        expect(page).to have_content "ログイン"
        click_link "ログイン"
        expect(page).to have_current_path user_session_path, ignore_query: true
      end
    end

    it "入力フォームに入力後、登録しマイページへのマイページへの遷移をテスト" do
      fill_in "user[name]",	with: "テストユーザー"
      fill_in "user[email]",	with: "test@.com"
      fill_in "user[password]", with: "111111"
      fill_in "user[password_confirmation]", with: "111111"
      within (".content-document-inner") do
        click_button "アカウント登録"
      end
        expect(page).to have_content "テストユーザー"
    end

    it "新規登録失敗" do
      fill_in "user[name]",	with: ""
      fill_in "user[email]",	with: ""
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: ""
      within (".content-document-inner") do
        click_button "アカウント登録"
      end
      expect(page).to have_content "ニックネームを入力してください"
    end
  end
end