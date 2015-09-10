# For more information see: http://emberjs.com/guides/routing/

YFHS.SingleNewsRoute = Ember.Route.extend
  model: (params)->
    @.store.findRecord 'news', params['news_id']
