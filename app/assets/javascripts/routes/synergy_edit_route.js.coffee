# For more information see: http://emberjs.com/guides/routing/

YFHS.SynergyEditRoute = Ember.Route.extend({
  model: (params)->
    Ember.RSVP.hash
      synergy: @store.findRecord('synergy', params.id, { reload: true })

  afterModel: (model)->
    _this = @
    model.synergy.get('playerClass').then(
      (pc)->
        _this.set 'pc', pc
    )

  setupController: (controller, model)->
    pc = @get 'pc'
    @_super controller, model
    controller.set 'currentPlayerClass', pc.get('en_name')

})
