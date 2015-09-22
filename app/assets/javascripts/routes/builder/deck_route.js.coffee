# For more information see: http://emberjs.com/guides/routing/

YFHS.BuilderDeckRoute = Ember.Route.extend
  model: ()->
    @.store.findAll 'player_class'
