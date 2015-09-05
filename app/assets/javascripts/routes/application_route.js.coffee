# For more information see: http://emberjs.com/guides/routing/

YFHS.ApplicationRoute = Ember.Route.extend
  currentUser: Ember.inject.service('current-user')
  init: ()->
    @._super.apply(@, arguments)
    @.get('currentUser').getUser()

  renderTemplate: (controller, model)->
    @._super controller, model
    if  @.get 'confirmation'
      @.render 'log-in',
        into: 'application',
        outlet: 'modal'

  model: ()->
    Ember.RSVP.hash
      user: @.store.createRecord 'user'
      news: @.store.findAll 'news'

  beforeModel: (transition)->
    if Ember.isPresent transition.queryParams.confirmation
      @.set 'confirmation', true

  actions:
    openModal: (name)->
      @.render name,
        into: 'application',
        outlet: 'modal'

    closeModal: ()->
      @.disconnectOutlet
        outlet: 'modal',
        parentView: 'application'


