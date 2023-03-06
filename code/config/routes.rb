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
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get 'myprofile'=>'profilo#index' #il mio profilo è gestito da funzione index in profilo_controller.rb
  get 'profilo/:id'=>'profilo#altro' #la visualizzazione di altri profili è gestita da show in profilo_controller.rb

  get 'news'=>'news#index'
  # Defines the root path route ("/")
  # root "articles#index"
  get 'wallet'=>'wallets#index'

  root 'index#index'



 

  get 'screener'=>'screener#index'  


    
end
