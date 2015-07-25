Rails.application.routes.draw do

    root to: 'static_pages#index'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    get '/playground', to: 'static_pages#playground'
    get '/about', to: 'static_pages#about'
    get '/contact', to: 'static_pages#contact'

    get '/logout', to: 'sessions#logout'
    get '/signup', to: 'users#new'

    get '/account', to: 'users#show'
    post '/account/reset_token', to: 'users#reset_token'

    resources :users
    resources :arts

    # get 'arts/index'

    namespace :api, defaults: {format: 'json'} do
      # /api/... Api::
      scope module: :v1 do
        resources :arts
        # resources :venues, only: [:index]
      end
    end

end
