RSpec.describe "Recipes" do
  describe "レシピ編集" do
    let!(:user) { create(:user) }
    let!(:recipe) { create(:recipe, user: user) }

    before do
      sign_in user
      visit edit_recipe_path(recipe)
    end

    context "コンテンツ" do
      it "更新ボタン、削除ボタンが存在するか" do
        expect(page).to have_button "更新"
        expect(page).to have_content "削除"
      end
    end

    context "更新" do
      it "更新成功" do
        fill_in "recipe[recipe_name]", with: "オムライス"
        fill_in "recipe[main_food]", with: "卵"
        fill_in "recipe[time]", with: "20"
        fill_in "recipe[price]", with: "1500"
        fill_in "recipe[recipe_how]", with: "1.卵を混ぜる"
        fill_in "recipe[material]", with: "1.卵1個"
        recipe.food = nil
        attach_file 'recipe[food]', File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')
        click_button "更新"
        expect(page).to have_current_path recipe_path(recipe.id), ignore_query: true
      end
    end
  end
end
