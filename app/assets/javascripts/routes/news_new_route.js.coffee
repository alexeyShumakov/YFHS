# For more information see: http://emberjs.com/guides/routing/

YFHS.NewsNewRoute = Ember.Route.extend
  model: ()->
    @.store.createRecord 'news'

