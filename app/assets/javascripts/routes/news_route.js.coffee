# For more information see: http://emberjs.com/guides/routing/

YFHS.NewsRoute = Ember.Route.extend
  model: (params)->
    @.store.findRecord 'news', params['news_id']

  actions:
    delete: ->
      _this = @
      @.modelFor(@.routeName).destroyRecord().then(
        ->
          _this.transitionTo 'news'
      )

