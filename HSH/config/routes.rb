Rails.application.routes.draw do
	
	resources :residences
 	resources :clientes
 	resources :users
  root 'users#index'

end
