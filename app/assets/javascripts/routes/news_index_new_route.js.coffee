# For more information see: http://emberjs.com/guides/routing/

YFHS.NewsIndexNewRoute = Ember.Route.extend
  model: ()->
    @.store.createRecord 'news'

  deactivate: ()->
    @.modelFor(@.routeName).unloadRecord()

  actions:
    newModel: ()->
      @.refresh()
