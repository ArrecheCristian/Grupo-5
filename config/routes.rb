Rails.application.routes.draw do
	
 	root 'users#index'

  	devise_for :admins
  	devise_for :users, controllers: {
        passwords: 'users/passwords' , registrations: 'users/registrations'
      }

	resources :hotsales do
  		collection do
    		get :reservation
  		end
	end
	resources :residences
 	resources :clientes
 	resources :auctions, :except => 'new' 
 	resources :user_lists

	resources :home_users do
  		collection do
    		get :auction_reservation
    		get :contact
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
	resources :lists
	resources :codes
    resources :premiums

 	get '/auctions/new/:id', to: 'auctions#new', as: 'new_auction'
	get 'home_users' => 'homeusers#index', as: :user_root  	


end
