RSpec.describe "Recipes" do
  describe "レシピ一覧" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipes) { FactoryBot.create_list(:recipe, 6, user: user).each_with_index do |r, i|
      r.recipe_name = r.recipe_name + i.to_s
      r.id = i
      r.price = i
      r.save!
    end
    }

    context "非ログイン時" do
      before do
        visit recipes_path
      end

      it "一覧ページに5つのレシピが表示される" do
        recipes[1..5].all? do |r|
          expect(page).to have_content r.recipe_name
          expect(page).to have_content r.time
        end
      end

      it "６個目のレシピが表示されないこと" do
        expect(page).not_to have_content recipes[5]
      end

      it "レシピの名前をクリック後のページ遷移" do
        click_link recipes[1].recipe_name
        expect(page).to have_current_path release_recipe_path(recipes[1].id), ignore_query: true
      end
    end
  end
end