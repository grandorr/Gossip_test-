Rails.application.routes.draw do
resources :gossips
resources :users
resources :teams,  only: [:index]
resources :contacts,  only: [:index]
resources :welcomes , only: [:index]
resources :city
resources :comment
end
