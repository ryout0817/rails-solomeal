require 'rails_helper'

RSpec.describe "Accounts" do
  context "公開ユーザーページ" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipe) { FactoryBot.create(:recipe, user: user) }

    before do
      sign_in user
      visit release_account_path(user.id)
    end

    context "コンテンツ" do
      it "一覧ページへリンク押下後の遷移を確認" do
        expect(page).to have_content "一覧ページへ"
        click_link "一覧ページへ"
        expect(current_path).to eq recipes_path
      end

      it "ユーザー情報が表示されるか" do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
        expect(page).to have_content recipe.recipe_name
      end

      it "公開しているレシピの遷移の確認" do
        click_link recipe.recipe_name
        expect(current_path).to eq release_recipe_path(recipe.id)
      end
    end
  end
end