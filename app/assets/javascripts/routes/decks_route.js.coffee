# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksRoute = Ember.Route.extend
  model: (params)->
    Ember.RSVP.hash
      decks: @store.query 'deck', params
      deckTypes: @store.findAll 'deck_type'
      playerClasses: @store.findAll 'player_class'
  deactivate: ()->
    @controller.clearProp()
