# For more information see: http://emberjs.com/guides/routing/

YFHS.DecksSearchRoute = Ember.Route.extend({
  queryParams:
    player_class:
      refreshModel: true
    deck_type:
      refreshModel: true
    name:
      refreshModel: true
  model: (params)->
    Ember.RSVP.hash
      decks: @store.query 'deck', params

  deactivate: ()->
    @controller.clearProp()
})
