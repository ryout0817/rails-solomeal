RSpec.describe "Accounts" do
  describe "マイページ編集" do
    let!(:user) {FactoryBot.create(:user)}

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
        expect(current_path).to eq account_path(user.id)
      end
    end

    context "リンク" do
      it "戻るリンク押下後の遷移" do
        click_link "戻る"
        expect(current_path).to eq account_path(user.id)
      end
    end
  end
end