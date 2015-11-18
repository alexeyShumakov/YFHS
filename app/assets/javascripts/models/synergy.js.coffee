# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Synergy = DS.Model.extend YFHS.Votable,
  name: DS.attr 'string'
  description: DS.attr 'string'
  user: DS.belongsTo 'user'
  userId: DS.attr 'number'
  cards: DS.hasMany 'synergies_card'
  commentsCount: DS.attr 'number'
  playerClass: DS.belongsTo 'player_class'
  createdAt: DS.attr 'date'

  sortProp: ['card.cost', 'card.name']
  sortedCards: Ember.computed.sort 'cards', 'sortProp'

  isWhole: Ember.computed 'cards', ()->
    Ember.isEqual @get('cards.length'), 3

  totalCards: Ember.computed 'cards', ()->
    @get('cards.length')

  pushCard: (card)->
    card.set 'isActive', false
    sCard= @store.createRecord 'synergies_card',
      card: card
      synergy: @
    @get('cards').pushObject sCard
    sCard

  removeCard: (sCard)->
    sCard.set 'card.isActive', true
    sCard.destroyRecord()
