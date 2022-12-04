RSpec.describe "Recipes" do
  describe "レシピ作成" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:recipe) { FactoryBot.create(:recipe, user: user) }

    context "非ログイン時のレシピ一覧" do
      before do
        visit recipes_path
      end
    end
  end
end