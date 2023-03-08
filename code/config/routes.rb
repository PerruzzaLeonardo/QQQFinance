Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post "/users/sign_up" => "users/registrations#create"
    post "/users/sign_in" => "users/sessions#create"
    get "users/sign_out" => "users/sessions#destroy"
  end
  resources :wallets
  resources :users
  resources :azione
  resources :profilo
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
end
