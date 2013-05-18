FeedEngine::Application.routes.draw do
  root :to => 'welcome#index'

  mount Resque::Server, at: "/resque"

  # OmniAuth
  get '/auth/:provider/callback', to: 'sessions#create', as: :callback
  get '/auth/failure', to: 'sessions#error', as: :failure

  resources :trips
  get '/dashboard', to: 'trips#dashboard', as: :dashboard

  get '/request_to_view_private_trip',
    to: 'erin_layouts/layouts#request_to_view_private_trip',
    as: 'request_to_view_private_trip'

  get '/manage_trip',
    to: 'erin_layouts/layouts#manage_trip',
    as: 'manage_trip'

  get '/manage_kreepings',
    to: 'erin_layouts/layouts#manage_kreepings',
    as: 'manage_kreepings'

  get '/login',
    to: 'phil_layouts/layouts#login',
    as: 'login'

  get '/signup',
    to: 'phil_layouts/layouts#signup',
    as: 'signup'

  get '/trip_feed',
    to: 'phil_layouts/layouts#trip_feed',
    as: 'trip_feed'

  get '/user_trips',
    to: 'phil_layouts/layouts#user_trips',
    as: 'user_trips'

  get '/account_settings',
    to: 'erin_layouts/layouts#account_settings',
    as: 'account_settings'
end
