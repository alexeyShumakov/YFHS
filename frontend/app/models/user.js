import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  email:          DS.attr('string'),
  nickname:       DS.attr('string'),
  publicNickname: DS.attr('string'),
  updatedAt:      DS.attr('date'),
  role:           DS.attr('string'),
  totalUnreadMessages: DS.attr('number'),

  messages:       DS.hasMany('message', {inverse: 'user'}),
  messageTarget:  DS.belongsTo('message', {inverse: 'target'}),
  dialogsOwner:   DS.hasMany('dialog', {inverse: 'owner'}),
  dialogsCompany: DS.hasMany('dialog', {inverse: 'company'}),
  decks:          DS.hasMany('deck'),
  synergies:      DS.hasMany('synergy'),
  news:           DS.hasMany('news'),
  comments:       DS.hasMany('comment'),

  isAdmin: Ember.computed('role', function(){
    return this.get('role') === 'admin';
  }),
  isAuthor(record) {
    return this.get('id').toString() === record.get('user.id').toString();
  }
});
