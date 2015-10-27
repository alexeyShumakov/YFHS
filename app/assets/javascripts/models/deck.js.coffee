# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Deck = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  createdAt: DS.attr 'string'

  votes: DS.attr 'number'
  userIncreaseVote: DS.attr 'boolean'
  userDecreaseVote: DS.attr 'boolean'

  deckType: DS.belongsTo 'deck_type'
  user: DS.belongsTo 'user'
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

  mana: Ember.computed ()->
    mana = [
      Ember.Object.create({cost: 0, name: 0, count: 0 }),
      Ember.Object.create({cost: 1, name: 1, count: 0 }),
      Ember.Object.create({cost: 2, name: 2, count: 0 }),
      Ember.Object.create({cost: 3, name: 3, count: 0 }),
      Ember.Object.create({cost: 4, name: 4, count: 0 }),
      Ember.Object.create({cost: 5, name: 5, count: 0 }),
      Ember.Object.create({cost: 6, name: 6, count: 0 }),
      Ember.Object.create({cost: 7, name: '7+', count: 0 })
    ]
    cards = @get 'cards'
    maxCount = 0
    mana.forEach (manaItem)->
      cost = manaItem.get 'cost'
      count = 0
      cards.forEach (item)->
        if Ember.isEqual cost, 7
          if item.get('card.cost') >= 7
            count += item.get 'count'
        else
          if Ember.isEqual item.get('card.cost'), cost
            count += item.get 'count'
      manaItem.set 'count' , count
      maxCount = count if count > maxCount
    mana.forEach (manaItem)->
      if maxCount <= 8
        unitSize = 12.5
      else
        unitSize = 100/maxCount

      count = manaItem.get 'count'
      manaItem.set 'size', "height:#{count * unitSize}%".htmlSafe()
    mana


  increaseVote: ()->
    Ember.$.getJSON "/decks/#{@get 'id'}/increase_vote"
  decreaseVote: ()->
    Ember.$.getJSON "/decks/#{@get 'id'}/decrease_vote"

