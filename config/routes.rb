Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  get 'items/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: %i[index create]
    resources :comments, only: [:create]
  end
  resources :users, only: [:edit, :update, :show]
  resources :cards, only: [:new, :create, :show, :destroy]
  
end
