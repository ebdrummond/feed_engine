FeedEngine::Application.routes.draw do
  root :to => 'welcome#index'

  # OmniAuth
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'
  get '/dashboard', to: 'feeds#index', as: 'dashboard'

  resources :feeds
end
