# For more information see: http://emberjs.com/guides/routing/

YFHS.CardsRoute = Ember.Route.extend
  model: ()->
    this.store.findAll 'card'
