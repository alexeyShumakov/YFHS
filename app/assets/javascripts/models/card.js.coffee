# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Card = DS.Model.extend
  name: DS.attr 'string'
  card_set: DS.attr 'string'
  card_type: DS.attr 'string'
  player_class_str: DS.attr 'string'
  rarity: DS.attr 'string'
  cost: DS.attr 'number'
  attack: DS.attr 'number'
  health: DS.attr 'number'
  collectible: DS.attr 'boolean'
  img_url: DS.attr 'string'
  img_gold_url: DS.attr 'string'

  builderCards: DS.hasMany 'builder_card'

  isLegendary: Ember.computed 'rarity', ()->
    Ember.isEqual @.get('rarity'), 'Legendary'

  isActive: true
