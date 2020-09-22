Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  get 'favorites/index'
  get 'items/index'
  get 'orders/show'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :favorites, only: [:create, :destroy]
    resources :orders, only: %i[index create]
    resources :comments, only: [:create]
    resources :orders, only: %i[index create new]
  end
  resources :users, only: [:edit, :update, :show, :index]
  resources :cards, only: [:new, :create, :show, :destroy]

end
