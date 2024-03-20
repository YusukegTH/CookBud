Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"

  get 'search', to: 'pages#search'
  get 'profile', to: 'pages#profile'
  patch 'profile', to: 'pages#update_profile', as: 'update_profile'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :recipes, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
end
