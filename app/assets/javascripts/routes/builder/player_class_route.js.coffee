# For more information see: http://emberjs.com/guides/routing/

YFHS.BuilderPlayerClassRoute = Ember.Route.extend
  model: (params)->
    Ember.RSVP.hash
      playerClass: @store.findRecord 'player_class', params['id']
      deck: @store.createRecord 'deck'
      deckTypes: @store.findAll 'deck_type'

  afterModel: (model)->
    if @get('currentUser.isLogIn')
      model.deck.set 'user', @get('currentUser.user')

    model.deck.set 'playerClass', model.playerClass
    model.deck.set 'name', model.playerClass.get('name')
    model.deck.set 'deckType', model.deckTypes.get('firstObject')
    model.deck.save()

  setupController: (controller, model)->
    @_super controller, model
    controller.set 'currentPlayerClass', model.playerClass.get('en_name')
