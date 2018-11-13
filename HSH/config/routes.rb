Rails.application.routes.draw do
	
  get 'home_users/index'
	resources :residences
 	resources :clientes
 	resources :users
 	resources :home_users
  root 'users#index'

end
