# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Deck = DS.Model.extend
  name: DS.attr 'string'
  deckType: DS.belongsTo 'deck_type'
  playerClass: DS.belongsTo 'player_class'
  cards: DS.hasMany 'builder_card'

  sortedCards: Ember.computed 'totalCards', ()->
    @.get('cards').sortBy 'card.cost'

  isWhole: Ember.computed 'totalCards', ()->
    Ember.isEqual @.get('totalCards'), 30

  totalCards: Ember.computed 'cards.@each.count', ()->
    sum = 0
    @.get('cards').forEach (card)->
      sum += card.get('count')
    sum

  pushCard: (card)->
    if card.get 'isLegendary'
      card.set 'isActive', false
    builderCard = @.store.createRecord 'builder_card',
      card: card
      count: 1
    builderCard.save()
    @.get('cards').pushObject builderCard

  removeCard: (builderCard)->
    builderCard.set 'card.isActive', true
    builderCard.decrementProperty 'count'
    if Ember.isEqual builderCard.get('count'), 0
      builderCard.deleteRecord()
    builderCard.save()
