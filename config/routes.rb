Rails.application.routes.draw do
  post 'votes/increase'
  post 'votes/decrease'

  resources :deck_types
  resources :builder_cards

  get 'decks/search'

  resources :decks do
    member do
      get 'increase_vote'
      get 'decrease_vote'
    end
  end

  get 'builder' => 'builder#index'
  get 'builder/deck'
  get 'builder/synergy'
  get 'builder/d/:id' => 'builder#deck'

  resources :player_classes
  resources :cards
  resources :likes
  resources :comments
  get 'one_box/show'

  get 'users/get_current_user'

  resources :news
  devise_for :users, controllers: { confirmations: 'confirmations', passwords: 'passwords', sessions: 'sessions', registrations: 'registrations' }
  resources :users, only: [:show]
  root 'news#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
