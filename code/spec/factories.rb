FactoryBot.define do
    factory :user do
      nome {'Rspec121'}
      cognome {'Rspec1'}
      username{'RspecAccount51'}
      pubblico{'si'}
      email { "rspecmail511@mail.com" }
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
      user {'Rspec121'}
      azione{'MSFT'}
      quantità{5}
    end
  end
  