RSpec.describe "Accounts" do
  describe "退会手続き" do
    let!(:user) {FactoryBot.create(:user)}

    before do
      sign_in user
      visit withdrawal_accounts_path(user.id)
    end

    context "退会する" do
      it "退会手続き押下後、トップページに戻る" do
        click_link "退会する"
        expect(current_path).to eq "/"
      end
    end
  end
end