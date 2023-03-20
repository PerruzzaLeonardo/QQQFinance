require 'rails_helper'

RSpec.describe WalletsController, type: :controller do
  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user: user) }

  before do
    sign_in user
  end

  describe "POST #create" do
    it "aggiunge un'azione al wallet" do
      post :create, params: { wallet: { user_id: user.id } , action: { isin: "MSFT", quantity: 23 } }
      expect(response).to redirect_to(wallet_path(assigns(:wallet)))
      expect(assigns(:wallet).actions.count).to eq(1)
      expect(assigns(:wallet).actions.first.isin).to eq("MSFT")
    end
  end
end
