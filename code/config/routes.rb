Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post "/users/sign_up" => "users/registrations#create"
    post "/users/sign_in" => "users/sessions#create"
    get "users/sign_out" => "users/sessions#destroy"
  end

  resources :wallets do
    delete 'rimozione', on: :collection
    delete 'elimina',on: :collection
  end

  resources :users
  resources :azione
  resources :news
  resources :comment
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get 'myprofile'=>'profilo#index' #il mio profilo è gestito da funzione index in profilo_controller.rb
  post '/azione/:id', to: 'comment#create'
  get 'news'=>'news#index'
  # Defines the root path route ("/")
  # root "articles#index"
  get 'wallet'=>'wallets#index'

  root 'index#index'

  get 'screener'=>'screener#index'  

  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  post '/wallet/movimenti', to: 'wallets#movimenti'
  post '/wallet/rimozione', to: 'wallets#rimozione'

  delete 'wallets/rimozione', to: 'wallets#rimozione', as: 'delete_wallets'
  delete 'wallets/elimina', to: 'wallets#elimina', as: 'delete_position'

  get 'header' => 'header#header'

  post '/index/cerca',to: 'index#cerca'

  post '/screener/aggiungi', to: 'screener#aggiungi'
  post '/screener/aggiorna', to: 'screener#aggiorna'
  get '/screener/aggiorna', to: 'screener#aggiorna'
  post '/screener/index', to:'screener#index'

  get '/screener/risultato', to: 'screener#risultato'
  post '/screener/risultato', to: 'screener#risultato'


end
