Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"

  get 'search', to: 'pages#search'
  get 'profile', to: 'pages#profile'
  get 'search_results', to: 'pages#search_results'
  get 'search_results', to: 'pages#searchAi'
  get 'search_results', to: 'pages#imageAi'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :recipes, only: [:index, :show] do
    resources :reviews, only: [:create]
    get 'cooking', to: 'pages#cooking'
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: [:destroy]
end
