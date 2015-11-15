# For more information see: http://emberjs.com/guides/routing/

YFHS.SynergiesRoute = Ember.Route.extend({
  model: (params)->
    Ember.RSVP.hash
      synergies: @store.query 'synergy', params
      playerClasses: @store.findAll 'player_class'
  deactivate: ()->
    @controller.clearProp()

})
