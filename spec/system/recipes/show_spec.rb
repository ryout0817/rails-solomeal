require 'rails_helper'

RSpec.describe "Recipes" do
  context "レシピ詳細" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipe) { FactoryBot.create(:recipe, user: user) }

    before do
      sign_in user
      visit recipe_path(recipe.id)
    end

    context "コンテンツ" do
      it "マイレシピの情報を表示する" do
        expect(page).to have_content recipe.recipe_name
        expect(page).to have_content recipe.time
        expect(page).to have_content recipe.price
        expect(page).to have_content recipe.recipe_how
        expect(page).to have_content recipe.material
      end

      it "編集するリンク押下後の遷移をテスト" do
        expect(page).to have_content "編集する"
        click_link "編集する"
        expect(current_path).to eq edit_recipe_path(recipe.id)
      end

      it "戻るボタンリンクを押下" do
        expect(page).to have_content "戻る"
        click_link "戻る"
        expect(current_path).to eq account_path(user.id)
      end
    end
  end
end
