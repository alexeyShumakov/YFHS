
YFHS.DeckRoute = Ember.Route.extend({
  model: (params)->
    @store.find('deck', params.id)
})
