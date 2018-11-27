Rails.application.routes.draw do

  	devise_for :users
	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new'
 	resources :user_lists
 	resources :home_users
	resources :pujas
	resources :weeks
 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'
 	root 'users#index'
	get 'home_users' => 'homeusers#index', as: :user_root  	

end
