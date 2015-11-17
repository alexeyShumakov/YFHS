# For more information see: http://emberjs.com/guides/routing/

YFHS.IndexRoute = Ember.Route.extend({
  model: ()->
    store = @store
    Ember.RSVP.hash
      user: store.createRecord 'user'
      topDecks: store.query('deck', {limit: 5})
      topSynergies: store.query('synergy', {limit: 5})
      topCards: store.query('card', {limit: 5})
      streams: @store.query 'twitchStream', {}

})
