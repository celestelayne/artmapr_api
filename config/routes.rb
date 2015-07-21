Rails.application.routes.draw do

    root to: 'static_pages#index'
    get '/login', to: 'sessions#new'

    get '/about', to: 'static_pages#about'
    get '/contact', to: 'static_pages#contact'

    post '/sessions', to: 'sessions#create'
    get '/logout', to: 'sessions#logout'
    get '/signup', to: 'users#new'

    get '/account', to: 'users#show'
    post '/account/reset_token', to: 'users#reset_token'

    resources :users

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
