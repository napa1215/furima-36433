Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
