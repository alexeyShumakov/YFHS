# for more details see: http://emberjs.com/guides/components/

YFHS.DeckItemComponent = Ember.Component.extend
  oneBox: Ember.inject.service()
  isDetailed: false
  actions:
    showDetails: ()->
      @toggleProperty 'isDetailed'
      if @get('isDetailed')
        Ember.run.scheduleOnce 'afterRender', @, ()->
          id = '#' + @get('elementId')
          @get('oneBox').preview(id)
    showImage: (card)->
      @set 'currentCardImg', card.get('card.img_url')

