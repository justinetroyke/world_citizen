Rails.application.routes.draw do
  root 'home#index'

  resources :items, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show, :edit]
end
