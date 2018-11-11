Rails.application.routes.draw do
	
  get 'home_users/index'
	resources :residences
 	resources :clientes
 	resources :users
  root 'users#index'

end
