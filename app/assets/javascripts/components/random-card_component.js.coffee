# for more details see: http://emberjs.com/guides/components/

YFHS.RandomCardComponent = Ember.Component.extend({
  store: Ember.inject.service()
  isGold: false
  didInsertElement: ()->
    _this = @
    store = @get 'store'
    $.getJSON('/cards/random').then(
      (data)->
        store.pushPayload(data)
        _this.set 'card', store.peekRecord('card', data.card.id)
    )

  actions:
    toggleGold: ()->
      @toggleProperty('isGold')

})

