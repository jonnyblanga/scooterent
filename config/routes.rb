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

  get 'pages/user_page'
  get 'pages/user_page2'
  get 'pages/new'
  post 'pages/user_page2'
  get 'pages/user_page3'
  get 'pages/user_page4'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :scooters do #except: :index
    resources :reservations, except: [:edit, :update] do
      resources :reviews, only: [:new, :create]
    end
  end

end
