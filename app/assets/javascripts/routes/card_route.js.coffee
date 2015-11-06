# For more information see: http://emberjs.com/guides/routing/

YFHS.CardRoute = Ember.Route.extend({
  model: (params)->
    @get('store').find 'card', params['id']

})
