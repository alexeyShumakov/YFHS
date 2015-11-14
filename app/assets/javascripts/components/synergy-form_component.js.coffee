# for more details see: http://emberjs.com/guides/components/

YFHS.SynergyFormComponent = Ember.Component.extend({
  didInsertElement: ()->
    @get('synergy.cards').forEach (sCard)->
      sCard.disableCard()
  willDestroyElement: ()->
    @get('synergy.cards').forEach (sCard)->
      sCard.enableCard()

  actions:
    saveSynergy: ()->
      @get('synergy').save()
    removeFromDeck: (sCard)->
      @get('synergy').removeCard sCard

    addCardToSynergy: (card)->
      synergy = @get 'synergy'
      unless synergy.get('isWhole')
        currentBuilderCard = synergy.get('cards').findBy 'card.id', card.get 'id'
        if Ember.isBlank currentBuilderCard
          synergy.pushCard card

})

