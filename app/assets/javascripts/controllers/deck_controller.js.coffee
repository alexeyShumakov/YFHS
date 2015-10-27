# for more details see: http://emberjs.com/guides/controllers/

YFHS.DeckController = Ember.Controller.extend({
  actions:
    increaseVote: (model)->
      model.increaseVote()
      model.reload()

    decreaseVote: (model)->
      model.decreaseVote()
      model.reload()
})
