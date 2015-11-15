# For more information see: http://emberjs.com/guides/routing/

YFHS.BuilderSynergyRoute = Ember.Route.extend({
  model: (params)->
    Ember.RSVP.hash
      playerClass: @store.findRecord 'player_class', params['id']
      synergy: @store.createRecord 'synergy'
      deckTypes: @store.findAll 'deck_type'
  afterModel: (model)->
    if @get('currentUser.isLogIn')
      model.synergy.set 'user', @get('currentUser.user')
    model.synergy.set 'name', "#{model.playerClass.get('name')}-синергия"
    model.synergy.set 'playerClass', model.playerClass
    model.synergy.save()
  setupController: (controller, model)->
    @_super controller, model
    controller.set 'currentPlayerClass', model.playerClass.get('en_name')
})
