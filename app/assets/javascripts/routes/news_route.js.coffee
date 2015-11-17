# For more information see: http://emberjs.com/guides/routing/

YFHS.NewsRoute = Ember.Route.extend
  model: (params)->
    Ember.RSVP.hash
      news: @store.findRecord('news', params['id'])
      topDecks: @store.query('deck', {limit: 5})
      topSynergies: @store.query('synergy', {limit: 5})
      topCards: @store.query('card', {limit: 5})
      streams: @store.query 'twitchStream', {}

  actions:
    delete: ->
      _this = @
      @.modelFor(@.routeName).destroyRecord().then(
        ->
          _this.transitionTo 'news'
      )

