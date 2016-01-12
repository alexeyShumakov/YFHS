import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  email:          DS.attr('string'),
  nickname:       DS.attr('string'),
  publicNickname: DS.attr('string'),
  updatedAt:      DS.attr('date'),
  role:           DS.attr('string'),

  messages:       DS.hasMany('message'),
  dialogs:        DS.hasMany('dialog'),
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
