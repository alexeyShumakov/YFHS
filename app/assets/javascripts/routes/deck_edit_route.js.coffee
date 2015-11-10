# For more information see: http://emberjs.com/guides/routing/

YFHS.DeckEditRoute = Ember.Route.extend({
  model: (params)->
    Ember.RSVP.hash
      deckTypes: @store.findAll 'deck_type'
      deck: @store.find('deck', params['id'])
      bCards: @get('store').query('builder_card', {deck_id: params['id']})

  afterModel: (model)->
    _this = @
    model.deck.get('playerClass').then(
      (pc)->
        _this.set 'pc', pc
    )

  setupController: (controller, model)->
    pc = @get 'pc'
    @_super controller, model
    controller.set 'currentPlayerClass', pc.get('en_name')
})
