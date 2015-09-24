# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksRoute = Ember.Route.extend
  model: ()->
    @.store.findAll 'deck'
