require 'rails_helper'

RSpec.describe WalletsController, type: :controller do

  before(:all) do
    @user=FactoryBot.create(:user)
    @wallet= FactoryBot.create(:wallet)
    @azione= FactoryBot.create(:azione)
  end

  after(:all) do
    @user.destroy
  end

  describe "POST #movimenti" do
  #  it "aggiunge un'azione al wallet" do
   #   post :create, params: { wallet: { user: user.username, azione: "MSFT", quantità: 23 } }
    #  expect(response).to redirect_to(wallet_path(assigns(:wallet)))
     # expect(assigns(:wallet).azione).to eq("MSFT")
    #end
    context 'con isin corretto' do
      it 'aggiunge correttamente azione al wallet' do
        allow(controller).to receive(:authenticate_user!).and_return(true)
        expect{post :movimenti,params:{isin:'ABNB',quantità:5,commit:'aggiungi'}}.to change(Wallet, :count).by(1)
        expect(response).to redirect_to("/wallet")
        expect(flash[:notice]).to be_present
      end
    end

    context 'con isin non valido' do
      it 'non aggiunge azione al wallet' do
        expect{post :movimenti,params:{isin:'ABCD',quantità:5,commit:'aggiungi'}}.not_to change(Wallet, :count)
        expect(response).to redirect_to("/wallet")
        expect(flash[:notice]).to be_present
      end
    end
  end
end