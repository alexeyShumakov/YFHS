# For more information see: http://emberjs.com/guides/routing/

YFHS.SynergyRoute = Ember.Route.extend({
  model: (params)->
    @store.find 'synergy', params.id
})
