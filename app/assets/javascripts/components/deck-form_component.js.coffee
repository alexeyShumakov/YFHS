# for more details see: http://emberjs.com/guides/components/

YFHS.DeckFormComponent = Ember.Component.extend({
  deckTypeId: null
  didInsertElement: ()->
    @get('deck.cards').forEach (bCard)->
      bCard.disableCard()
  willDestroyElement: ()->
    @get('deck.cards').forEach (bCard)->
      bCard.enableCard()

  deckTypeItem: Ember.observer 'deckTypeId', ()->
    dTypes = @get('deckTypes')
    deckType = dTypes.findBy('id', @get('deckTypeId'))
    @set('deck.deckType', deckType)
    if @get('currentUser.isLogIn')
      @get('deck').save()

  actions:
    saveDeck: ()->
      if @get('currentUser.isLogIn')
        @get('deck').save()

    removeFromDeck: (builderCard)->
      @get('deck').removeCard builderCard

    addCardToDeck: (card)->
      deck = @get 'deck'
      unless deck.get('isWhole')
        currentBuilderCard = deck.get('cards').findBy 'card.id', card.get 'id'
        if Ember.isPresent currentBuilderCard
          unless card.get('isLegendary')
            card.set 'isActive', false
            if currentBuilderCard.get('count') < 2
              currentBuilderCard.incrementProperty 'count'
              if @get('currentUser.isLogIn')
                currentBuilderCard.save()
        else
          bCard = deck.pushCard card
          if @get('currentUser.isLogIn')
            bCard.save()

})

