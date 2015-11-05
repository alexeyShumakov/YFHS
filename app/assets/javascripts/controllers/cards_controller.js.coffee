# for more details see: http://emberjs.com/guides/controllers/

YFHS.CardsController = Ember.Controller.extend({
  actions:
    testAction: (card)->
      console.log card.get('name')
})
