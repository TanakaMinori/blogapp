Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets
  resources :users, only: [:show] 
  resources :profiles, only: [:new, :create, :edit, :update]
end
