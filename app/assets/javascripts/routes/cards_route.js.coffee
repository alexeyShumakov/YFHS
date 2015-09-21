# For more information see: http://emberjs.com/guides/routing/

YFHS.CardsRoute = Ember.Route.extend
  model: ()->
    Ember.RSVP.hash
      cards: @.store.findAll 'card'
