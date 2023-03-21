FactoryBot.define do
    factory :user do
      nome {'Account'}
      cognome {'Prova'}
      username{'ACCprova'}
      pubblico{'si'}
      email { "qqqfinance@gmail.com" }
      password { "qqqfinance" }
    end

    factory :wallet do
        user {:user}
    end
  end
  