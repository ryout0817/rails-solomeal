require 'rails_helper'

RSpec.describe "Tops", type: :system do
  describe "check Products system" do
    it "トップページのAboutリンクを押下後のA遷移をテスト" do
      visit "/"
      click_link "About"
      expect(current_path).to eq about_path
    end

    it "アバウトページのHomeリンクを押下後の遷移をテスト" do
      visit about_path
      click_link "Home"
      expect(current_path).to eq "/"
    end
  end
end
