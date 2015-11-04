# for more details see: http://emberjs.com/guides/components/

YFHS.VoteCompComponent = Ember.Component.extend({
  classNames: ['vote']
  tagName: 'span'
  actions:
    increaseVote: ()->
      @get('model').increaseVote()
      @get('model').reload()

    decreaseVote: ()->
      @get('model').decreaseVote()
      @get('model').reload()

})

