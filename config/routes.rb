Rails.application.routes.draw do
  get 'welcome/index'

  resources :films
  namespace :api do
    namespace :v1 do
      resources :films, only: [:index, :show, :create, :update, :desdtroy]
    end
  end

  get 'app', to: 'films#index'

  root to: 'welcome#index'
end
