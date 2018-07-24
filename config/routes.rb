Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :items, only: [:new, :create, :show]

  resources :users, only: [:new, :create, :show, :edit] do
    resources :passports, only: [:show]
  end

  resources :passports
end
