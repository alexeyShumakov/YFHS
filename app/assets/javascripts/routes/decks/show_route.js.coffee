# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksShowRoute = Ember.Route.extend({
  model: (params)->
    @store.find 'deck', params.id

})
