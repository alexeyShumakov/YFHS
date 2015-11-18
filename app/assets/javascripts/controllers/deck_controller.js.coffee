# for more details see: http://emberjs.com/guides/controllers/

YFHS.DeckController = Ember.Controller.extend({
  canEdit: Ember.computed 'model', ()->
    if @get('currentUser.isLogIn')
       @get('currentUser.user.isAdmin') or @get('currentUser.user').isAuthor(@get 'model')
    else
      false
  actions:
    removeDeck: ()->
      @get('model').destroyRecord()
})
