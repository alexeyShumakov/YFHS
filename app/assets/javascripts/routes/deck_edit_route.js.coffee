# For more information see: http://emberjs.com/guides/routing/

YFHS.DeckEditRoute = Ember.Route.extend({
  model: (params)->
    Ember.RSVP.hash
      deckTypes: @store.findAll 'deck_type'
      deck: @store.find('deck', params['id'])
      bCards: @get('store').query('builder_card', {deck_id: params['id']})
      cards: @store.findAll 'card'

  afterModel: (model)->
    _this = @
    model.bCards.forEach (bCard)->
      bCard.set 'card.isActive', false

    model.deck.get('playerClass').then(
      (pc)->
        _this.set 'pc', pc
    )

  setupController: (controller, model)->
    pc = @get 'pc'
    @_super controller, model
    playerClasses = Ember.A([
      Ember.Object.create {title: 'Нейтральные', name: 'Neutral', isActive: false}
      Ember.Object.create {title: pc.get('name'), name: pc.get('en_name'), isActive: true}
    ])
    controller.set 'playerClasses', playerClasses
    controller.set 'currentPlayerClass', pc.get('en_name')

  deactivate: ()->
    @modelFor(@routeName).deck.get('cards').forEach (item)->
      item.set('card.isActive', true)
})
