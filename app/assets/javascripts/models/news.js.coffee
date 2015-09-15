# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.News = DS.Model.extend
  title: DS.attr 'string'
  body: DS.attr 'string'
  user: DS.belongsTo 'user'
  comments: DS.hasMany 'comment'
  likes: DS.hasMany 'like'
  likesCount: Ember.computed 'likes', ()->
    @.get 'likes.length'
