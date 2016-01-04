import DS from 'ember-data';
import Ember from 'ember';
import Votable from './votable';

export default Votable.extend({
  name:           DS.attr('string'),
  description:    DS.attr('string'),
  commentsCount:  DS.attr('number'),
  createdAt:      DS.attr('date'),

  user:           DS.belongsTo('user'),
  playerClass:    DS.belongsTo('player_class'),

  cards: Ember.computed.alias('synergyCards'),
  synergyCards:          DS.hasMany('synergy_card'),

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
    let sCard= this.store.createRecord('synergy_card',{
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
