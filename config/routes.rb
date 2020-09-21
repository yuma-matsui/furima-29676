Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  get 'items/index'
  get 'orders/show'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :comments, only: [:create]
    resources :orders, only: %i[index create new]
  end
  resources :users, only: [:edit, :update, :show]
  resources :cards, only: [:new, :create, :show, :destroy]

end
