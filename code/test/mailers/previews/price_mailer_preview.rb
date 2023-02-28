# Preview all emails at http://localhost:3000/rails/mailers/price_mailer
class PriceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/price_mailer/oscillazione_prezzo
  def oscillazione_prezzo
    PriceMailer.oscillazione_prezzo
  end

end
