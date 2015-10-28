# for more details see: http://emberjs.com/guides/components/

YFHS.DeckItemComponent = Ember.Component.extend
  oneBox: Ember.inject.service()
  actions:
    showDetails: ()->
      @toggleProperty 'isDetailed'
      if @get('isDetailed')
        Ember.run.scheduleOnce 'afterRender', @, ()->
          id = '#' + @get('elementId')
          @get('oneBox').preview(id)

    increaseVote: ()->
      @get('deck').increaseVote()
      @get('deck').reload()

    decreaseVote: ()->
      @get('deck').decreaseVote()
      @get('deck').reload()
