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
        expect(page).to have_content recipe.recipe_name
      end

      it "ゲストログイン押下後ゲストログインしてトップページに遷移すること" do
        within (".main-btn") do
          click_link "ゲストログイン"
        end
          user = create(:user)

          expect(user).to be_valid

          expect(current_path).to eq "/"
      end

      it "サイドバーのリンクの遷移をテスト" do
        click_link "Home"
        expect(current_path).to eq "/"
        click_link "Concept"
        expect(current_path).to eq about_path
        click_link "SignUp"
        expect(current_path).to eq new_user_registration_path
        click_link "Login"
        expect(current_path).to eq user_session_path
        click_link "Recipe"
        expect(current_path).to eq recipes_path
        click_link "ホーム"
        expect(current_path).to eq "/"
        click_link "コンセプト"
        expect(current_path).to eq about_path
        click_link "新規登録"
        expect(current_path).to eq new_user_registration_path
        click_link "レシピ一覧"
        expect(current_path).to eq recipes_path
        within('.menu') do
          click_link "ログイン"
          expect(current_path).to eq user_session_path
        end
        within('.side-title') do
          click_on "ひとり飯"
          expect(current_path).to eq "/"
        end
        within('.header-left') do
          click_on "ひとり飯"
          expect(current_path).to eq "/"
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
          expect(current_path).to eq account_path(user.id)
          click_link "レシピ作成"
          expect(current_path).to eq new_recipe_path
          click_link "アカウント編集"
          expect(current_path).to eq edit_user_registration_path
          click_link "退会手続き"
          expect(current_path).to eq withdrawal_accounts_path
          click_link "新規レシピ一覧"
          expect(current_path).to eq recipes_path
        end
      end

      it "ログアウトボタンを押下後、非ログイン状態に戻ること" do
        within('.side-list') do
          click_link "ログアウト"
          expect(current_path).to eq "/"
          expect(page).to have_content "SignUp"
        end
      end
    end
  end
end
