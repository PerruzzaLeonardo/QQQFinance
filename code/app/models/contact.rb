class Contact < MailForm::Base
  include MailForm::Delivery

  
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate:true
  attribute :utente_segnalato

  def headers
    { 
      to: "qqqfinanceassi@gmail.com", # change this to be the email you want sent to
      subject: "Comunicazione utente",
      from: %("#{name}" <#{email}>)
    }
  end
end
