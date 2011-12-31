Loser::Application.routes.draw do

  root :to => 'players#index'
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "players#new", :as => "signup"
 
  resources :payments
  resources :players
  resources :weights
  resources :sessions

  match 'losers' => 'players#index'  
end
