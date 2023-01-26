require 'rails_helper'

RSpec.describe "Tops" do
  describe "check Products system" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:recipe) { FactoryBot.create(:recipe, user: user) }

    context "非ログイン時のトップページ" do
      before do
        visit "/"
      end

      it "非ログイン時の文字列のテスト" do
        expect(page).to have_content('ゲストログイン')
        expect(page).to have_content('ひとり飯')
      end

      it "ゲストログイン押下後ゲストログインしてトップページに遷移すること" do
        within (".main-btn") do
          click_link "ゲストログイン"
        end
          user = create(:user)

          expect(user).to be_valid

          expect(page).to have_current_path "/"
      end

      it "サイドバーのリンクの遷移をテスト" do
        click_link "Home"
        expect(page).to have_current_path "/"
        click_link "Concept"
        expect(page).to have_current_path about_path, ignore_query: true
        click_link "SignUp"
        expect(page).to have_current_path new_user_registration_path, ignore_query: true
        click_link "Login"
        expect(page).to have_current_path user_session_path, ignore_query: true
        click_link "Recipe"
        expect(page).to have_current_path recipes_path, ignore_query: true
        click_link "ホーム"
        expect(page).to have_current_path "/"
        click_link "コンセプト"
        expect(page).to have_current_path about_path, ignore_query: true
        click_link "新規登録"
        expect(page).to have_current_path new_user_registration_path, ignore_query: true
        click_link "レシピ一覧"
        expect(page).to have_current_path recipes_path, ignore_query: true
        within('.menu') do
          click_link "ログイン"
          expect(page).to have_current_path user_session_path, ignore_query: true
        end
        within('.side-title') do
          click_on "ひとり飯"
          expect(page).to have_current_path "/"
        end
        within('.header-left') do
          click_on "ひとり飯"
          expect(page).to have_current_path "/"
        end
      end
    end

    context "ログイン時のトップページ" do
      before do
        sign_in user
        visit "/"
      end

      it "ログイン時の文字列の確認" do
        expect(page).to have_content('レシピ作成')
      end

      it "サイドバーの遷移をテスト" do
        within('.side-list') do
          click_link "マイページ"
          expect(page).to have_current_path account_path(user.id), ignore_query: true
          click_link "レシピ作成"
          expect(page).to have_current_path new_recipe_path, ignore_query: true
          click_link "アカウント編集"
          expect(page).to have_current_path edit_user_registration_path, ignore_query: true
          click_link "退会手続き"
          expect(page).to have_current_path withdrawal_accounts_path, ignore_query: true
          click_link "新規レシピ一覧"
          expect(page).to have_current_path recipes_path, ignore_query: true
        end
      end

      it "ログアウトボタンを押下後、非ログイン状態に戻ること" do
        within('.side-list') do
          click_link "ログアウト"
          expect(page).to have_current_path "/"
          expect(page).to have_content "SignUp"
        end
      end
    end
  end
end
