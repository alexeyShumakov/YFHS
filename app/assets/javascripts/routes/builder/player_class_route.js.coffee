# For more information see: http://emberjs.com/guides/routing/

YFHS.BuilderPlayerClassRoute = Ember.Route.extend
  model: (params)->
    Ember.RSVP.hash
      playerClass: @.store.findRecord 'player_class', params['id']
      cards: @.store.findAll 'card'
      deck: @.store.createRecord 'deck'
      deckTypes: @.store.findAll 'deck_type'

  afterModel: (model)->
    model.deck.set 'playerClass', model.playerClass
    model.deck.set 'name', model.playerClass.get('name')
    model.deck.set 'deckType', model.deckTypes.get('firstObject')
    model.deck.save()

  setupController: (controller, model)->
    @._super controller, model
    playerClasses = Ember.A([
      Ember.Object.create {title: 'Нейтральные', name: 'Neutral', isActive: false}
      Ember.Object.create {title: model.playerClass.get('name'), name: model.playerClass.get('en_name'), isActive: true}
    ])
    controller.set 'deckTypeId', model.deck.get('deckType.id')
    controller.set 'playerClasses', playerClasses
    controller.set 'playerClass', model.playerClass.get('en_name')
    controller.set 'playerClassConst', model.playerClass.get('en_name')
    controller.set 'cost', null
    controller.set 'keyword', null
