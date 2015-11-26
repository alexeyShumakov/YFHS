Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount_ember_app :yfhs, to: '/'
  root 'news#index'

  # resources :users do
  #   get 'get_current_user', on: :collection
  #   member do
  #     get 'decks'
  #     get 'comments'
  #     get 'synergies'
  #   end
  # end
  #
  # resources :cards, only: [:show, :index]
  #
  # resources :synergies, only: [:index, :show, :edit] do
  #   get 'search', on: :collection
  # end
  #
  # resources :decks, only: [:show, :index, :edit] do
  #   get 'search', on: :collection
  # end
  #
  # resources :news, only: [:show, :index]
  #
  # get 'builder', to: 'builder#index'
  # get 'builder/deck/:id', to: 'builder#deck'
  # get 'builder/synergy/:id', to: 'builder#synergy'
  #
  # post 'votes/increase'
  # post 'votes/decrease'
  #
  # get 'one_box/show'

  # namespace :api do
  #   resources :twitch_streams, :deck_types,
  #             :player_classes, :builder_cards, :comments,
  #             :synergies, :decks, :synergies_cards, :news
  #   resources :cards do
  #     get 'random', on: :collection
  #   end
  # end
end
