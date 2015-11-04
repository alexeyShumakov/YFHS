# for more details see: http://emberjs.com/guides/components/

YFHS.UserPopupComponent = Ember.Component.extend({
  store: Ember.inject.service()
  classNames: ['user-popup']
  isShowPopup: false
  showPopup: ()->
    @set 'isShowPopup', true
  hidePopup: ()->
    @set 'isShowPopup', false

  mouseEnter: ()->
    _this = @
    if Ember.isBlank @get 'decks'
      params =
        user_id: @get 'user.id'
        limit: 3
      @get('store').query('deck', params).then(
        (decks)->
          _this.set 'decks', decks
      )
    run = Ember.run
    run.cancel(@get 'hide')
    @set 'show', run.debounce(@, @showPopup, 100)
  mouseLeave: ()->
    run = Ember.run
    run.cancel(@get 'show')
    @set 'hide', run.later(@, @hidePopup, 450)
})

