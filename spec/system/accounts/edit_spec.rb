RSpec.describe "Accounts" do
  describe "マイページ編集" do
    let!(:user) { create(:user) }

    before do
      sign_in user
      visit edit_account_path(user.id)
    end

    context "更新" do
      it "更新成功" do
        user.avatar = nil
        attach_file 'user[avatar]', File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')
        fill_in "user[name]",	with: user.name
        fill_in "user[introduction]", with: "こんにちは"
        click_button "更新"
        expect(page).to have_current_path account_path(user.id), ignore_query: true
      end
    end

    context "リンク" do
      it "戻るリンク押下後の遷移" do
        click_link "戻る"
        expect(page).to have_current_path account_path(user.id), ignore_query: true
      end
    end
  end
end
