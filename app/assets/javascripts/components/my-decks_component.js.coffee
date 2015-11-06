# for more details see: http://emberjs.com/guides/components/

YFHS.MyDecksComponent = Ember.Component.extend({
  store: Ember.inject.service()
  tagName: 'li'
  classNames: ['dropdown']
  classNameBindings: ['open']
  isAllDecks: false
  open: false
  mouseEnter: ()->
    Ember.run.cancel(@get 'hide')
  mouseLeave: ()->
    @set 'hide', Ember.run.later(@, @hideDecks, 450)
  moreDecks: Ember.computed ()->
    length = @get('decks').get 'length'
    if Ember.isBlank(@get('decks')) or length < 10
      false
    else
      true
  hideDecks: ()->
    @set 'isAllDecks', false
    @set 'open', false

  actions:
    removeDeck: (deck)->
      deck.destroyRecord()
    showAll: ()->
      @set 'loading', true
      store = @get 'store'
      _this = @
      params =
        user_id: @get('currentUser.user.id')
        page: -1
      store.query('deck', params).then(
        (decks)->
          _this.set 'loading', false
          _this.set 'isAllDecks', true
          _this.set 'decks', decks
      )

    toggleOpen: ()->
      store = @get 'store'
      _this = @
      params =
        user_id: @get('currentUser.user.id')
        limit: 10
      store.query('deck', params).then(
        (decks)->
          _this.set 'decks', decks
          _this.toggleProperty 'open'
      )


})

