Rails.application.routes.draw do

	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new'	
 	resources :users
 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'
  root 'users#index'

end
