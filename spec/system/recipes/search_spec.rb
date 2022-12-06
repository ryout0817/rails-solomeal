RSpec.describe "Recipes" do
  describe "レシピ検索" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipes) { FactoryBot.create_list(:recipe, 6, user: user).each_with_index do |r, i|
      user_name = user.name + i.to_s
      r.recipe_name = r.recipe_name + i.to_s
      r.id = i
      r.price = i
      r.save!
    end
    }

    context "レシピ検索" do
      before do
        sign_in user
        visit recipes_path
      end

      it "レシピ一覧ページから該当するキーワード検索後の表示確認" do
        within (".search-wrap") do
          fill_in "q[recipe_name_cont]", with: "オ"
          click_on "検索"
        end
        expect(current_path).to eq search_recipes_path
        expect(page).to have_content recipes[1].recipe_name
        expect(page).to have_content "検索結果：#{recipes.count}件"
      end

      it "該当しないキーワードを検索後、表示されないことを確認" do
        within (".search-wrap") do
          fill_in "q[recipe_name_cont]", with: "肉"
          click_on "検索"
        end
        expect(page).not_to have_content recipes[1].recipe_name
        expect(page).to have_content "検索結果：0件"
      end
    end

    context "検索結果のコンテンツのリンク確認" do
      before do
        sign_in user
        visit search_recipes_path
      end

      it "レシピ名の遷移を確認" do
        click_on recipes[0].recipe_name
        expect(current_path).to eq release_recipe_path(recipes[0].id)
      end
    end
  end
end
