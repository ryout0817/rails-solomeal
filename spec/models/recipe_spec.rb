require 'rails_helper'

RSpec.describe Recipe do
  describe "Recipe" do
    let!(:user) { FactoryBot.create(:user) }

    context "不適切なレシピの情報を入力時のみ許可する" do
      it "21文字以上のレシピの名前を入力した時" do
        recipe = Recipe.new(recipe_name: "１２３４５６７８９１２３４５６７８９１２３", main_food: "豚肉", time: "10", price: "1000", user_id: user.id)
        expect(recipe).not_to be_valid
      end

      it "メインの材料に半角数字を入力した場合" do
        recipe = Recipe.new(recipe_name: "卵焼き", main_food: "butaniku", time: "2", price: "1000", user_id: user.id)
        expect(recipe).not_to be_valid
      end
    end
  end
end
