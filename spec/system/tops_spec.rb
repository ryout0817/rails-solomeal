require 'rails_helper'

RSpec.describe "Tops", type: :system do
  before do
    visit about_path
  end
  it "click About" do
      expect(page).to have_content('Home')
  end
end
