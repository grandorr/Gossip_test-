Rails.application.routes.draw do
resources :gossips
resources :users
resources :teams,  only: [:index]
resources :contacts,  only: [:index]
resources :welcomes , only: [:index]
resources :city
resources :comment
resources :sessions, only: [:new, :create, :destroy]
resources :like, only: [:new, :create, :destroy]
end
