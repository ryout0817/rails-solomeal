require 'rails_helper'

RSpec.describe "Accounts" do
  context "公開ユーザーページ" do
    let!(:user) { create(:user) }
    let!(:recipe) { create(:recipe, user: user) }

    before do
      sign_in user
      visit release_account_path(user.id)
    end

    context "コンテンツ" do
      it "一覧ページへリンク押下後の遷移を確認" do
        expect(page).to have_content "一覧ページへ"
        click_link "一覧ページへ"
        expect(page).to have_current_path recipes_path, ignore_query: true
      end

      it "ユーザー情報が表示されるか" do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
        expect(page).to have_content recipe.recipe_name
      end

      it "公開しているレシピの遷移の確認" do
        click_link recipe.recipe_name
        expect(page).to have_current_path release_recipe_path(recipe.id), ignore_query: true
      end
    end
  end
end