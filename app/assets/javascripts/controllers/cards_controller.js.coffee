# for more details see: http://emberjs.com/guides/controllers/

YFHS.CardsController = Ember.Controller.extend({
  actions:
    transitionToCard: (card)->
      @transitionToRoute 'card', card.get('id')
})
