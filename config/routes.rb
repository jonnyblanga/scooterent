Rails.application.routes.draw do
  get 'scooters/index'
  get 'scooters/show'
  get 'scooters/new'
  get 'scooters/create'
  get 'scooters/edit'
  get 'scooters/update'
  get 'scooters/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
