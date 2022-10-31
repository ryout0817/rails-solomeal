require 'rails_helper'

RSpec.describe "Tops", type: :system do
  before do
    visit "/"
  end
  describe "check Products system" do
  it "click About" do
      click_link "About"
      expect(current_path).to eq about_path
  end
  end
end
