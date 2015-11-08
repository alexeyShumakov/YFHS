# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.News = DS.Model.extend YFHS.Votable,
  name: DS.attr 'string'
  body: DS.attr 'string'
  user: DS.belongsTo 'user'
