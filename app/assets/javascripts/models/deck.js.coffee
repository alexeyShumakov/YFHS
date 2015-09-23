# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Deck = DS.Model.extend
  name: DS.attr 'string'
  type: DS.attr 'string'
  cards: DS.hasMany 'card'
