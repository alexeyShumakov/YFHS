# for more details see: http://emberjs.com/guides/components/

YFHS.DeckItemComponent = Ember.Component.extend
  actions:
    showDetails: ()->
      @toggleProperty 'isDetailed'

    increaseVote: ()->
      @get('deck').increaseVote()
      @get('deck').reload()

    decreaseVote: ()->
      @get('deck').decreaseVote()
      @get('deck').reload()
