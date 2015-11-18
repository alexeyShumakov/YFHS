# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.User = DS.Model.extend
  email: DS.attr 'string'
  nickname: DS.attr 'string'
  updatedAt: DS.attr 'date'
  role: DS.attr 'string'
  # TODO change it
  password: DS.attr 'string'
  password_confirmation: DS.attr 'string'
  # ===

  decks: DS.hasMany 'deck'
  synergies: DS.hasMany 'synergy'
  news: DS.hasMany 'news'
  comments: DS.hasMany 'comment'

  isAdmin: Ember.computed 'role', ()->
    @get('role') == 'admin'
  isAuthor: (record)->
    @get('id').toString() == record.get('userId').toString()
