# For more information see: http://emberjs.com/guides/routing/

YFHS.NewsIndexRoute = Ember.Route.extend
  model: ()->
    @.store.findAll 'news'
