# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksRoute = Ember.Route.extend
  model: ()->
    Ember.RSVP.hash
      decks: @store.findAll 'deck'
      cards: @store.findAll 'card'
