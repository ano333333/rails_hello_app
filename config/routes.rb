Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: %i[create destroy]
  resources :account_activations, only: [:edit]
  resources :relationships, only: %i[create destroy]
  resources :password_resets, only: %i[new create edit update]
end
