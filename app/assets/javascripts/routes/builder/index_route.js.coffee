# For more information see: http://emberjs.com/guides/routing/

YFHS.BuilderIndexRoute = Ember.Route.extend({
  model: ()->
    @.store.findAll 'player_class'
})
