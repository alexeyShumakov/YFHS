# For more information see: http://emberjs.com/guides/routing/

YFHS.UserRoute = Ember.Route.extend({
  model: (params)->
    @store.find 'user', params.id
})
