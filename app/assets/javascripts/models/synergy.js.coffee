# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Synergy = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  user: DS.belongsTo 'user'
  cards: DS.hasMany 'synergies_card'

  sortedCards: Ember.computed 'totalCards', ()->
    @.get('cards').sortBy 'card.cost'

  isWhole: Ember.computed 'cards', ()->
    Ember.isEqual @get('cards.length'), 3

  totalCards: Ember.computed 'cards', ()->
    @get('cards.length')

  pushCard: (card)->
    _this = @
    card.set 'isActive', false
    sCard= @store.createRecord 'synergies_card',
      card: card
      synergy: @
    sCard.save().then(
      (card)->
        _this.get('cards').pushObject card
    )

  removeCard: (sCard)->
    sCard.set 'card.isActive', true
    sCard.destroyRecord()
