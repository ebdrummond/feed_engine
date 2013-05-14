FeedEngine::Application.routes.draw do
  root :to => 'welcome#index'

  # OmniAuth
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'

  get '/dashboard', to: 'feeds#index', as: 'dashboard'
  resources :feeds

  get '/request_to_view_private_trip',
    to: 'erin_layouts/layouts#request_to_view_private_trip',
    as: 'request_to_view_private_trip'

  get '/kreepr_requests',
    to: 'erin_layouts/layouts#kreepr_requests',
    as: 'kreepr_requests'

  get '/new_trip',
    to: 'erin_layouts/layouts#new_trip',
    as: 'new_trip'

  get '/manage_trip',
    to: 'erin_layouts/layouts#manage_trip',
    as: 'manage_trip'

  get '/manage_kreepings',
    to: 'erin_layouts/layouts#manage_kreepings',
    as: 'manage_kreepings'

  get '/account_settings',
    to: 'erin_layouts/layouts#account_settings',
    as: 'account_settings'
end
