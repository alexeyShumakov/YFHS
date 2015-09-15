# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Like = DS.Model.extend
  user: DS.belongsTo 'user'
  news: DS.belongsTo 'news'
