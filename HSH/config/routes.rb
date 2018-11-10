Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html##
#  resources :viviendas
 resources :residences
 resources :users
 root 'users#index'
#  root 'viviendas#index'
end
