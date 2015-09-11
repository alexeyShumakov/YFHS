# For more information see: http://emberjs.com/guides/routing/

YFHS.ApplicationRoute = Ember.Route.extend

  beforeModel: (transition)->
    @.get('currentUser').getUser()
    if Ember.isPresent transition.queryParams.confirmation
      @.set 'confirmation', true

  model: ()->
    Ember.RSVP.hash
      user: @.store.createRecord 'user'

  renderTemplate: (controller, model)->
    @._super controller, model
    if  @.get 'confirmation'
      @.render 'log-in',
        into: 'application',
        outlet: 'modal'


  actions:
    openModal: (name)->
      @.render name,
        into: 'application',
        outlet: 'modal'

    closeModal: ()->
      @.disconnectOutlet
        outlet: 'modal',
        parentView: 'application'


