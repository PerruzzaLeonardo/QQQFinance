require 'rails_helper'

RSpec.describe WalletsController, type: :controller do

  before(:each) do
    @user=FactoryBot.create(:user)
    sign_in @user, scope: :user
    @wallet= FactoryBot.create(:wallet)
    @azione= FactoryBot.create(:azione)
    
  end

  after(:each) do
    @user.destroy
  end

  describe "GET wallet" do
    it 'should returns a 200 status code' do
      get 'index'
      expect(response.status).to eq(200)
    end

    it 'should render the index page' do
      get 'index'
      expect(response).to render_template('index')
    end
  end


  describe "POST #movimenti" do

    it 'should render the "aggiungi un azione" form' do
      get 'index'
      expect(response).to render_template('index')
    end

    it 'should return a 302 status code' do
      post :create,params:{wallet:{azione:"MSFT",quantità:1}}
      expect(response.status).to eq(302) #redirect status code
    end

    it "aggiunge un'azione al wallet" do
      post :create, params: { wallet: { user: @user.username, azione: "MSFT", quantità: 23 } }
      expect(response).to redirect_to(wallet_path(assigns(:wallet)))
      expect(assigns(:wallet).azione).to eq("MSFT")
     end

    context 'con isin corretto' do
      it 'aggiunge correttamente azione al wallet' do
        before_count=Wallet.count
         expect { post :movimenti, params: { isin: 'MSFT', quantità: 5, commit: 'aggiungi' }}.to change { Wallet.count }.by(1)
        expect(response).to redirect_to("/wallet")
      end
    end

    context 'con isin non valido' do
      it 'non aggiunge azione al wallet' do
        expect { post :movimenti, params: { isin: 'ABCD', quantità: 5, commit: 'aggiungi' } }.to_not change { Wallet.count }
        expect(response).to redirect_to("/wallet")
      end
    end
  end
end