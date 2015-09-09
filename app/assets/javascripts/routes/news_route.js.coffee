# For more information see: http://emberjs.com/guides/routing/

YFHS.NewsRoute = Ember.Route.extend
  model: ()->
    @.store.findAll 'news'
