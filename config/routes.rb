FeedEngine::Application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :feeds, only: [ :show ]
    end
  end

  root :to => 'welcome#index'

  mount Resque::Server, at: "/resque"

  # OmniAuth
  get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  get '/auth/instagram/callback', to: 'auth_sources#create', as: 'callback'
  get '/auth/foursquare/callback', to: 'auth_sources#create', as: 'callback'

  get '/auth/failure', to: 'sessions#error', as: 'failure'

  delete '/auth/:provider', to: 'auth_sources#destroy', as: 'auth_source'

  get '/dashboard', to: 'trips#dashboard', as: :dashboard
  get '/account', to: 'users#account', as: :account
  put '/account', to: 'users#update', as: :update_account

  resources :feeds

  resources :user_trips, only: [ :destroy ]

  resources :trips do
    resources :notes, only: [ :create, :destroy ]
    member do
      post '/users', to: 'user_trips#create', as: :add_user
      delete '/users', to: 'user_trips#destroy', as: :delete_user
    end
  end

  get '/users/:username', to: 'users#show', as: :user
  delete '/users', to: 'users#destroy', as: :user

end
