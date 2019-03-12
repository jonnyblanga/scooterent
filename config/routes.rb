Rails.application.routes.draw do
  # get 'reservations/new'
  # get 'reservations/create'
  # get 'reservations/index'
  # get 'reservations/show'
  # get 'reservations/destroy'
  # get 'reservations/edit'
  # get 'reservations/update'
  # get 'scooters/index'
  # get 'scooters/show'
  # get 'scooters/new'
  # get 'scooters/create'
  # get 'scooters/edit'
  # get 'scooters/update'
  # get 'scooters/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :scooters, except: :index
  resources :reservations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
