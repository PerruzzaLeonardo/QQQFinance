require 'rails_helper'

RSpec.describe WalletsController, type: :controller do

  before(:all) do
    @user = FactoryBot.create(:user)
    #@wallet= FactoryBot.create(:wallet)
    @azione= FactoryBot.create(:azione)
  end

  after(:all) do
    @user.destroy
  end

  describe "aggiunta al wallet" do
  #  it "aggiunge un'azione al wallet" do
   #   post :create, params: { wallet: { user: user.username, azione: "MSFT", quantità: 23 } }
    #  expect(response).to redirect_to(wallet_path(assigns(:wallet)))
     # expect(assigns(:wallet).azione).to eq("MSFT")
    #end

    it "isin non valido" do
      get :movimenti, params: {isin:'ABCD',quantità:5}

      expect(response).to have_content('ABCD non è un isin valido') 
    end
  end
end