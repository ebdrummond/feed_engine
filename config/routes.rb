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

  get '/dashboard', to: 'trips#dashboard', as: :dashboard
  get '/account', to: 'users#account', as: :account
  put '/account', to: 'users#update', as: :update_account

  resources :feeds

  resources :user_trips

  resources :trips do
    resources :notes, only: [ :create, :destroy ]
  end

  get '/request_to_view_private_trip',
    to: 'erin_layouts/layouts#request_to_view_private_trip',
    as: 'request_to_view_private_trip'

  get '/manage_trip',
    to: 'erin_layouts/layouts#manage_trip',
    as: 'manage_trip'

  get '/manage_kreepings',
    to: 'erin_layouts/layouts#manage_kreepings',
    as: 'manage_kreepings'

  get '/trip_feed',
    to: 'phil_layouts/layouts#trip_feed',
    as: 'trip_feed'

  # get '/user_trips',
  #   to: 'phil_layouts/layouts#user_trips',
  #   as: 'user_trips'
end
