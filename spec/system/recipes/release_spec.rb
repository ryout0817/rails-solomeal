require 'rails_helper'

RSpec.describe "Recipes" do
  context "レシピ詳細" do
    let!(:user) { create(:user) }
    let!(:recipe) { create(:recipe, user: user) }

    before do
      sign_in user
      visit release_recipe_path(recipe.id)
    end

    context "コンテンツ" do
      it "マイレシピの情報を表示する" do
        expect(page).to have_content recipe.recipe_name
        expect(page).to have_content recipe.main_food
        expect(page).to have_content recipe.time
        expect(page).to have_content recipe.price
        expect(page).to have_content recipe.recipe_how
        expect(page).to have_content recipe.material
      end

      it "戻るリンク押下後の遷移をテスト" do
        expect(page).to have_content "戻る"
        click_link "戻る"
        expect(page).to have_current_path recipes_path, ignore_query: true
      end
    end
  end
end
