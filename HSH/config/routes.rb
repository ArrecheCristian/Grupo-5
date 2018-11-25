Rails.application.routes.draw do


  get 'user_lists/index'
  get 'user_lists/show'
	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new'
 	resources :users
 	resources :home_users
	resources :pujas
 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'

  	root 'users#index'

end
