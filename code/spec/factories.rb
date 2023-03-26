FactoryBot.define do
    factory :user do
      nome {'Rspec'}
      cognome {'Rspec'}
      username{'RspecAccount'}
      pubblico{'si'}
      email { "rspecmail@mail.com" }
      password { "rspecpassword" }
    end

    factory :azione do
      nome {'Microsoft Corporation'}
      isin {'MSFT'}
      paese{'United States'}
      settore {'Technology'}
      prezzo {100}
    end

    factory :wallet do
      user {'ACCprova'}
      azione{'MSFT'}
      quantità{5}
    end
  end
  