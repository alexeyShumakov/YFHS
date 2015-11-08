# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.Comment = DS.Model.extend YFHS.Votable,
  user: DS.belongsTo 'user'
  commentable_id: DS.attr 'number'
  commentable_type: DS.attr 'string'
  body: DS.attr 'string'
  createdAt: DS.attr 'date'
  targetName: DS.attr 'string'
