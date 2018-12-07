Rails.application.routes.draw do
	
 	root 'users#index'

  	devise_for :admins
  	devise_for :users

	resources :hotsales
	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new' 
 	resources :user_lists

	resources :home_users do
  		collection do
    		get :auction_reservation
  		end
	end

	resources :pujas
	
	resources :weeks do
		collection do
  			get :reservation
  		end
	end
	
	resources :seekers
	resources :users
	resources :cancellations
	post :admins_controllers, to: 'admins#validations', as: 'validations' 
	
	get '/users/edit_custom/:id', to: 'users#edit_custom', as: 'edit_custom'
 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'
	get 'home_users' => 'homeusers#index', as: :user_root  	

	put  '/users/edit_custom/:id', to: 'users#update_custom', as: 'update_custom'

end
