Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :films
  namespace :api do
    namespace :v1 do
      resources :films, only: [:index, :show, :create, :update, :destroy]

      post 'signup', to: 'users#create', as: 'signup'
      post 'login', to: 'sessions#create', as: 'login'
      post 'logout', to: 'sessions#destroy', as: 'logout'
    end
  end

  get 'app', to: 'films#index'

  root to: 'welcome#index'
end
