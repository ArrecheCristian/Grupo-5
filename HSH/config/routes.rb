Rails.application.routes.draw do


  

  devise_for :users
  get 'user_lists/index'
  get 'user_lists/show'
	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new'
 	
 	resources :home_users
	resources :pujas
	resources :weeks
 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'
 	root 'users#index'
	get 'home_users' => 'HomeUsers#index', as: :user_root  	
end
