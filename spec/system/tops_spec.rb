require 'rails_helper'

RSpec.describe "Tops" do
  describe "check Products system" do
    let!(:user) { create(:user) }
    let(:recipe) { create(:recipe, user: user) }

    context "非ログイン時のトップページ" do
      before do
        visit "/"
      end

      it "非ログイン時の文字列のテスト" do
        expect(page).to have_content('ゲストログイン')
        expect(page).to have_content('ひとり飯')
      end

      it "ゲストログイン押下後ゲストログインしてトップページに遷移すること" do
        click_link "ゲストログイン", match: :first
        user = create(:user)
        expect(user).to be_valid
        expect(page).to have_current_path "/"
      end
    end

    context "サイドバーのリンクを押下したとき" do
      before do
        visit "/"
      end

      it "Home" do
        click_link "Home"
        expect(page).to have_current_path "/"
      end

      it "Concept" do
        click_link "Concept"
        expect(page).to have_current_path "/", ignore_query: true
      end

      it "Signup" do
        click_link "SignUp"
        expect(page).to have_current_path new_user_registration_path, ignore_query: true
      end

      it "Login" do
        click_link "Login"
        expect(page).to have_current_path user_session_path, ignore_query: true
      end

      it "Recipe" do
        click_link "Recipe"
        expect(page).to have_current_path recipes_path, ignore_query: true
      end

      # ハンバーガーメニュー
      it "ホーム" do
        click_link "ホーム"
        expect(page).to have_current_path "/"
      end

      it "コンセプト" do
        click_link "コンセプト"
        expect(page).to have_current_path about_path, ignore_query: true
      end

      it "新規登録" do
        click_link "新規登録"
        expect(page).to have_current_path new_user_registration_path, ignore_query: true
      end

      it "レシピ一覧" do
        click_link "レシピ一覧"
        expect(page).to have_current_path recipes_path, ignore_query: true
      end

      it "ログイン" do
        within('.menu') do
          click_link "ログイン"
          expect(page).to have_current_path user_session_path, ignore_query: true
        end
      end
    end

    describe "ログイン時のトップページ" do
      before do
        sign_in user
        visit "/"
      end

      it "ログイン時の文字列の確認" do
        expect(page).to have_content('レシピ作成')
      end

      context "サイドバーの遷移をテスト" do
        it "マイページ" do
          within('.user-list-spec') do
            click_link "マイページ"
            expect(page).to have_current_path account_path(user.id), ignore_query: true
          end
        end

        it "レシピ作成" do
          within('.user-list-spec-second') do
            click_link "レシピ作成"
            expect(page).to have_current_path new_recipe_path, ignore_query: true
          end
        end

        it "アカウント編集" do
          click_link "アカウント編集"
          expect(page).to have_current_path edit_user_registration_path, ignore_query: true
        end

        it "退会手続き" do
          click_link "退会手続き"
          expect(page).to have_current_path withdrawal_accounts_path, ignore_query: true
        end

        it "新規レシピ一覧" do
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
