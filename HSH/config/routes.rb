Rails.application.routes.draw do


  
  devise_for :users
	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new'
 	resources :users
 	resources :home_users
	resources :pujas
 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'
  	root 'home_users#index'
    
  
end
