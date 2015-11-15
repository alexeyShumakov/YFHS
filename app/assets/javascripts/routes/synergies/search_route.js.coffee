# For more information see: http://emberjs.com/guides/routing/

YFHS.SynergiesSearchRoute = Ember.Route.extend({
  queryParams:
    player_class:
      refreshModel: true
    name:
      refreshModel: true
  model: (params)->
    Ember.RSVP.hash
      synergies: @store.query 'synergy', params

  setupController: (controller, model, params)->
    @._super controller, model
    controller.set('params', params.queryParams)
    @controllerFor( 'synergies').set 'nameText', params.queryParams.name

  deactivate: ()->
    @controller.clearProp()

})
