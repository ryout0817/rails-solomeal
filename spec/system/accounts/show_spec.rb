require 'rails_helper'

RSpec.describe "Accounts" do
  context "マイページ" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipe) { FactoryBot.create(:recipe, user: user) }

    before do
      sign_in user
      visit account_path(user.id)
    end

    context "コンテンツ" do
      it "編集リンク押下後の遷移を確認" do
        expect(page).to have_content "編集する"
        click_link "編集する"
        expect(current_path).to eq edit_account_path(user.id)
      end

      it "ユーザー情報が表示されるか" do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
        expect(page).to have_content recipe.recipe_name
      end

      it "マイレシピの遷移の確認" do
        click_link recipe.recipe_name
        expect(current_path).to eq recipe_path(recipe.id)
      end

      it "レスポンシブで下の画面に発生するリンクの遷移を確認" do
        within (".mypage-list") do
          click_link "マイページ編集"
          expect(current_path).to eq edit_account_path(user.id)
          visit account_path(user.id)
          click_link "退会手続き"
          expect(current_path).to eq withdrawal_accounts_path
        end
      end
    end
  end
end