RSpec.describe "Accounts" do
  describe "退会手続き" do
    let!(:user) {FactoryBot.create(:user)}

    before do
      sign_in user
      visit withdrawal_accounts_path(user.id)
    end

    context "コンテンツ" do
      it "退会手続き押下後、トップページに戻る" do
        click_link "退会する"
        expect(current_path).to eq "/"
      end

      it "戻るボタンを押下" do
        click_link "戻る"
        expect(current_path).to eq account_path(user.id)
      end
    end
  end
end