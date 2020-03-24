Rails.application.routes.draw do
  get 'welcome/index'

  resources :films
  get 'app', to: 'films#index'

  root to: 'welcome#index'
end
