Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }
  get 'one_box/show'
  namespace :votes do
    post 'increase'
    post 'decrease'
  end
  mount_ember_app :frontend, to: '/'

  namespace :api do
    jsonapi_resources :player_classes
    jsonapi_resources :deck_types
    jsonapi_resources :builder_cards
    jsonapi_resources :users
    jsonapi_resources :decks
    jsonapi_resources :cards
    jsonapi_resources :twitch_streams
    jsonapi_resources :synergies
    jsonapi_resources :synergy_cards
    jsonapi_resources :comments
    jsonapi_resources :news
  end
end
