# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.User = DS.Model.extend
  email: DS.attr 'string'
  news: DS.hasMany 'news'
  password: DS.attr 'string'
  password_confirmation: DS.attr 'string'
