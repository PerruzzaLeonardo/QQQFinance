class ProfiloController < ApplicationController
  def index

  end

  def altro
    @altrui=User.find(params[:id]) #deve ritornare le caratteristiche dell' id-esimo utente nel db
    @sueazioni=Wallet.where(:user => altrui.username) #contiene isin e quantita delle azioni che l'id-esimo utente detiene
  end
end
