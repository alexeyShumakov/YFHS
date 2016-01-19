import DS from 'ember-data';

export default DS.Model.extend({
  unread:           DS.attr('boolean'),
  unreadCount:      DS.attr('number'),
  createdAt:        DS.attr('date'),

  owner:            DS.belongsTo('user'),
  company:          DS.belongsTo('user'),
  dialogsMessages:  DS.hasMany('dialogs-message')
});
