# For more information see: http://emberjs.com/guides/routing/

YFHS.ApplicationRoute = Ember.Route.extend
  model: ()->
    @get('currentUser').getUser()
  actions:
    openModal: (name)->
      @render name,
        into: 'application',
        outlet: 'modal'

    closeModal: ()->
      @disconnectOutlet
        outlet: 'modal',
        parentView: 'application'
