RSpec.describe "Recipes" do
  describe "レシピ作成" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipe) { FactoryBot.create(:recipe, user: user) }

    before do
      sign_in user
      visit new_recipe_path
    end
    context "コンテンツ" do
      it "登録するボタン" do
        expect(page).to have_button "登録する"
      end
    end

    context "レシピ登録" do
      it "登録成功" do
        fill_in "recipe[recipe_name]", with: recipe.recipe_name
        fill_in "recipe[main_food]", with: recipe.main_food
        fill_in "recipe[time]", with: recipe.time
        fill_in "recipe[price]", with: recipe.price
        fill_in "recipe[recipe_how]", with: recipe.recipe_how
        fill_in "recipe[material]", with: recipe.material
        attach_file 'recipe[food]', File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')
        click_button "登録する"
        expect(current_path).to eq recipes_path
      end

      it "必須の部分を記入せずに登録後失敗" do
        fill_in "recipe[recipe_name]", with: ""
        fill_in "recipe[main_food]", with: ""
        fill_in "recipe[time]", with: ""
        fill_in "recipe[price]", with: ""
        fill_in "recipe[recipe_how]", with: recipe.recipe_how
        fill_in "recipe[material]", with: recipe.material
        attach_file 'recipe[food]', File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')
        click_button "登録する"
        expect(current_path).not_to eq recipes_path
        expect(current_path).to eq new_recipe_path
      end

      it "バリデーションの確認" do
        fill_in "recipe[recipe_name]", with: "abcdefghijklmnopqrstu"
        fill_in "recipe[main_food]", with: "egg"
        fill_in "recipe[time]", with: "卵"
        fill_in "recipe[price]", with: "卵"
        fill_in "recipe[recipe_how]", with: recipe.recipe_how
        fill_in "recipe[material]", with: recipe.material
        attach_file 'recipe[food]', File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')
        click_button "登録する"
        expect(current_path).not_to eq recipes_path
        expect(current_path).to eq new_recipe_path
      end
    end
  end
end