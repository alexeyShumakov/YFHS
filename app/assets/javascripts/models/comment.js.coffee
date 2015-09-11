# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Comment = DS.Model.extend
  user: DS.belongsTo 'user'
  news: DS.belongsTo 'news'
  body: DS.attr 'string'
