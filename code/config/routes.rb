Rails.application.routes.draw do
  resources :wallets
  resources :users
  resources :azione
  resources :profilo
  resources :news
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'myprofile'=>'profilo#index' #il mio profilo è gestito da funzione index in profilo_controller.rb
  get 'profilo/:id'=>'profilo#altro' #la visualizzazione di altri profili è gestita da show in profilo_controller.rb

  get 'news'=>'news#index'
  # Defines the root path route ("/")
  # root "articles#index"
  get 'wallet'=>'wallets#index'

  root 'index#index'

  get 'signup'=>'signup#index'

  get 'login'=>'login#index'

  get 'screener'=>'screener#index'  
  
    post 'signup' => 'signup#create'
end
