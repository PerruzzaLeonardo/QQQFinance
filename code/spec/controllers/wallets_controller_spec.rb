require 'rails_helper'

RSpec.describe WalletsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:wallet) { FactoryBot.create(:wallet, user: user) }

  before do
    sign_in user
  end

  describe "POST #create" do
    it "aggiunge un'azione al wallet" do
      post :create, params: { wallet: { user: user.username, azione: "MSFT", quantità: 23 } }
      expect(response).to redirect_to(wallet_path(assigns(:wallet)))
      expect(assigns(:wallet).azione).to eq("MSFT")
    end
  end
end