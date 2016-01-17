import DS from 'ember-data';

export default DS.Model.extend({
  dialog: DS.belongsTo('dialog'),
  message: DS.belongsTo('message'),
  createdAt: DS.attr('date')
  
});
