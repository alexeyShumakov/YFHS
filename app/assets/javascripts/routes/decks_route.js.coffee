# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksRoute = Ember.Route.extend
  queryParams:
    player_class:
      refreshModel: true
  model: (params)->
    Ember.RSVP.hash
      decks: @store.query 'deck', params
      cards: @store.findAll 'card'
      playerClasses: @store.findAll 'player_class'
