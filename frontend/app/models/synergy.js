import DS from 'ember-data';
import Ember from 'ember';
import Votable from '../mixins/votable';

export default DS.Model.extend(Votable, {
  name:           DS.attr('string'),
  description:    DS.attr('string'),
  userId:         DS.attr('number'),
  commentsCount:  DS.attr('number'),
  createdAt:      DS.attr('date'),

  user:           DS.belongsTo('user'),
  playerClass:    DS.belongsTo('player_class'),

  cards:          DS.hasMany('synergies_card'),

  sortProp: ['card.cost', 'card.name'],
  sortedCards: Ember.computed.sort('cards', 'sortProp'),

  isWhole: Ember.computed('cards', function(){
    return Ember.isEqual(this.get('cards.length'), 3);
  }),

  totalCards: Ember.computed('cards', function(){
    return this.get('cards.length');
  }),

  pushCard(card){
    card.set('isActive', false);
    let sCard= this.store.createRecord('synergies_card',{
      card: card,
      synergy: this
    });
    this.get('cards').pushObject(sCard);
    return sCard;
  },

  removeCard(sCard){
    sCard.set('card.isActive', true);
    sCard.destroyRecord();
  }
});