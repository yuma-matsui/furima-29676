Rails.application.routes.draw do
  get 'users/show'
  get 'items/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: %i[index create]
  end
  resources :users, only: [:edit, :update]
end
