# For more information see: http://emberjs.com/guides/routing/

YFHS.ApplicationRoute = Ember.Route.extend
  currentUser: Ember.inject.service('current-user')
  init: ()->
    @.get('currentUser').getUser()
  model: ()->
    Ember.RSVP.hash
      user: @.store.createRecord 'user'
      news: @.store.findAll 'news'
  actions:
    openModal: (name)->
      @.render(name, {
        into: 'application',
        outlet: 'modal'
        })
    closeModal: ()->
      @.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      })

