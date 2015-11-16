# For more information see: http://emberjs.com/guides/routing/

YFHS.ApplicationRoute = Ember.Route.extend

  model: ()->
    store = @store
    @get('currentUser').getUser()
    Ember.RSVP.hash
      user: store.createRecord 'user'
      topDecks: store.query('deck', {limit: 5})
      topSynergies: store.query('synergy', {limit: 5})
      topCards: store.query('card', {limit: 5})
  actions:
    openModal: (name)->
      @render name,
        into: 'application',
        outlet: 'modal'

    closeModal: ()->
      @disconnectOutlet
        outlet: 'modal',
        parentView: 'application'
