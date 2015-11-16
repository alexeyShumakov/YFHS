# For more information see: http://emberjs.com/guides/routing/

YFHS.CardRoute = Ember.Route.extend({
  model: (params)->
    store = @store
    Ember.RSVP.hash
      card: store.find 'card', params['id']
      topDecks: store.query('deck', {limit: 5})
      topSynergies: store.query('synergy', {limit: 5})
      topCards: store.query('card', {limit: 5})

})
