
YFHS.DeckRoute = Ember.Route.extend({
  model: (params)->
    @store.find('deck', params.id)
  afterModel: (model)->
    @store.query('builder_card', {deck_id: model.get('id')})
})
