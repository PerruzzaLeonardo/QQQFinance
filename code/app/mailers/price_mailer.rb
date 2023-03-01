class PriceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.price_mailer.oscillazione_prezzp.subject
  #
  def oscillazione_prezzo
    #se quando aggiorno un titolo il suo prezzo è oscillato di almeno x%, invoco 'oscillazione_prezzo' nella funzione che aggiorna i titoli
    # e gli passo come parametri l'isin dell'azione e la mail degli utenti che li hanno in wallet(uno per volta con un ciclo)
    @greeting = "Ciao"
    @user=params[:user]
    @isin=params[:isin]
    @prezzo=params[:prezzo]
    @variazione=params[:variazione]

    mail to: email,subject:"Oscillazione posizione superiore al 5%"
  end
end
