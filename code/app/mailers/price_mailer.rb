class PriceMailer < ApplicationMailer

  def oscillazione_prezzo(user,isin,prezzo,variazione)
    @greeting = "Ciao"
    @user = user
    @isin = isin
    @prezzo = prezzo
    @variazione = variazione

    mail to: @user.email,subject:"Oscillazione posizione superiore al 5%"
  end
end
