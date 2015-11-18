# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Deck = DS.Model.extend YFHS.Votable,
  name: DS.attr 'string'
  description: DS.attr 'string'
  createdAt: DS.attr 'date'
  curve: DS.attr()
  commentsCount: DS.attr 'number'

  deckType: DS.belongsTo 'deck_type'
  userId: DS.attr 'number'
  user: DS.belongsTo 'user'
  playerClass: DS.belongsTo 'player_class'
  cards: DS.hasMany 'builder_card'

  sortedCards: Ember.computed 'totalCards', ()->
    @.get('cards').sortBy 'card.cost'

  isWhole: Ember.computed 'totalCards', ()->
    Ember.isEqual @.get('totalCards'), 30

  mana: Ember.computed 'curve', ()->
    items = @get('curve').items
    items.forEach (manaItem)->
      manaItem.styleSize  = "height:#{manaItem.size}%".htmlSafe()
    items

  totalCards: Ember.computed 'cards.@each.count', ()->
    sum = 0
    @.get('cards').forEach (card)->
      sum += card.get('count')
    sum

  pushCard: (card)->
    _this = @
    if card.get 'isLegendary'
      card.set 'isActive', false
    builderCard = @.store.createRecord 'builder_card',
      card: card
      count: 1
      deck: @
    builderCard.save().then(
      (bCard)->
        _this.get('cards').pushObject bCard
    )

  removeCard: (builderCard)->
    builderCard.set 'card.isActive', true
    builderCard.decrementProperty 'count'
    if Ember.isEqual builderCard.get('count'), 0
      builderCard.destroyRecord()
    else
      builderCard.save()
