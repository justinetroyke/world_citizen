Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :items, only: [:new, :create, :show]
  resources :businesses, only: [:new, :create, :show]
  resources :campaigns, only: [:index]

  resources :users, only: [:new, :create, :show, :edit] do
    resources :passports, only: [:show]
  end

  resources :passports
  resources :stamps, only: [:index, :show]
  namespace :api do
    namespace :v1 do
      namespace :stamps do
         get '/all', :to => 'stamps#index'
      end
      namespace :login do
        post '', :to => 'sessions#create'
      end
    end
  end
end
