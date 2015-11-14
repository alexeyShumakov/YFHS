# for more details see: http://emberjs.com/guides/controllers/

YFHS.BuilderSynergyController = Ember.Controller.extend({
  actions:
    addCardToSynergy: (card)->
      console.log card.get('name')

})

