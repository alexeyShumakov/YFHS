# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Card = DS.Model.extend YFHS.Votable,
  commentsCount: DS.attr 'number'

  cardGameId: DS.attr 'string'
  name: DS.attr 'string'
  card_set: DS.attr 'string'
  durability: DS.attr 'number'
  card_type: DS.attr 'string'
  race: DS.attr 'string'
  player_class_str: DS.attr 'string'
  faction: DS.attr 'string'
  rarity: DS.attr 'string'
  cost: DS.attr 'number'
  attack: DS.attr 'number'
  health: DS.attr 'number'
  text: DS.attr 'string'
  flavor: DS.attr 'string'
  artist: DS.attr 'string'
  collectible: DS.attr 'boolean'
  elite: DS.attr 'boolean'
  img_url: DS.attr 'string'
  mechanics: DS.attr()
  img_gold_url: DS.attr 'string'

  builderCards: DS.hasMany 'builder_card'

  isLegendary: Ember.computed 'rarity', ()->
    Ember.isEqual @.get('rarity'), 'Legendary'

  isActive: true
