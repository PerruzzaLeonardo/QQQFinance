class PriceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.price_mailer.oscillazione_prezzo.subject
  #
  def oscillazione_prezzo(isin)
    #se quando aggiorno un titolo il suo prezzo è oscillato di almeno x%, invoco 'oscillazione_prezzo' nella funzione che aggiorna i titoli
    # e gli passo come parametri l'isin dell'azione
    @greeting = "Ciao"
    @user=params[:user]
    @isin=params[:isin]
    @prezzo=params[:prezzo]
    @variazione=params[:variazione]
    #cerco utenti che hanno in wallet l'isin passato come parametro e li notifico

    mail to: email,subject:"Oscillazione posizione superiore al 5%"
  end
end
