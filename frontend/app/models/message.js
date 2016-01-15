import DS from 'ember-data';

export default DS.Model.extend({
  unread:         DS.attr('boolean'),
  body:           DS.attr('string'),
  createdAt:      DS.attr('date'),

  user:           DS.belongsTo('user'),
  target:         DS.belongsTo('user'),
  dialogsMessage: DS.belongsTo('dialogs-message')
});
