Rails.application.routes.draw do
	
  
	resources :residences
	resources :clientes
	resources :users
	resources :home_users
  root 'users#index'

end
