# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.DeckType = DS.Model.extend
  name: DS.attr 'string'
  desks: DS.hasMany 'desk'
