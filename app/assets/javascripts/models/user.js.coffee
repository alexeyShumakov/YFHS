# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.User = DS.Model.extend
  email: DS.attr 'string'
  # TODO change it
  password: DS.attr 'string'
  password_confirmation: DS.attr 'string'
  # ===

  news: DS.hasMany 'news'
  comments: DS.hasMany 'comment'
  likes: DS.hasMany 'like'
