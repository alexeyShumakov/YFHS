# for more details see: http://emberjs.com/guides/components/

YFHS.DeckItemComponent = Ember.Component.extend
  loading: false
  store: Ember.inject.service()
  actions:
    showDetails: ()->
      _this = @
      if @get 'isDetailed'
        @toggleProperty 'isDetailed'
      else
        @set 'loading', true
        @get('store').query('builder_card', {deck_id: @get('deck.id')}).then(
          ()->
            _this.set 'loading', false
            _this.toggleProperty 'isDetailed'
        )
