# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.PlayerClass = DS.Model.extend
  name: DS.attr 'string'
  en_name: DS.attr 'string'
  decks: DS.hasMany 'deck'
