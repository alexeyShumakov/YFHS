# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksSearchRoute = Ember.Route.extend({
  queryParams:
    player_class:
      refreshModel: true
  model: (params)->
    Ember.RSVP.hash
      decks: @store.query 'deck', params
})
