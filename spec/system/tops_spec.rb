require 'rails_helper'

RSpec.describe "Tops", type: :system do
  describe "check Products system" do
    it "Aboutリンクを押下後のAboutページへの遷移をテスト" do
      visit "/"
      click_link "About"
      expect(current_path).to eq about_path
    end
  end
end
