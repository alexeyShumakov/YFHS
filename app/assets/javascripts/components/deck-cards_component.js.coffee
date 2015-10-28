# for more details see: http://emberjs.com/guides/components/

YFHS.DeckCardsComponent = Ember.Component.extend({
  actions:
    removeCard: (card)->
      if @get('editable')
        @sendAction 'action', card

})

