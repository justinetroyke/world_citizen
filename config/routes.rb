Rails.application.routes.draw do
  root 'home#index'

  resources :items, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show, :edit] do
    resources :passport, only: [:show]
  end
end
