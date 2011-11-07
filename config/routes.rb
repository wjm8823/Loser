Loser::Application.routes.draw do
  resources :payments
  resources :players
  resources :weights

  match 'losers' => 'players#index'  

end
