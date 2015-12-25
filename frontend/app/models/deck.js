import DS from 'ember-data';
import Ember from 'ember';
import Votable from './votable';

export default Votable.extend({
  name:           DS.attr('string'),
  description:    DS.attr('string'),
  createdAt:      DS.attr('date'),
  curve:          DS.attr(),
  commentsCount:  DS.attr('number'),
  userId:         DS.attr('number'),

  deckType:       DS.belongsTo('deck_type'),
  user:           DS.belongsTo('user'),
  playerClass:    DS.belongsTo('player_class'),

  cards: Ember.computed.alias('builderCards'),
  builderCards:   DS.hasMany('builder_card'),

  sortProp: ['card.cost', 'card.name'],
  sortedCards: Ember.computed.sort('cards', 'sortProp'),

  isWhole: Ember.computed('totalCards', function(){
    return Ember.isEqual(this.get('totalCards'), 30);
  }),

  mana: Ember.computed('curve', function(){
    let items = this.get('curve').items;
    items.forEach((manaItem)=>{
      manaItem.styleSize  = `height:${manaItem.size}%`.htmlSafe();
    });
    return items;
  }),

  totalCards: Ember.computed('cards.@each.count', function(){
    let sum = 0;
    this.get('cards').forEach(function(card){
      sum += card.get('count');
    });
    return sum;
  }),

  pushCard(card){
    if (card.get('isLegendary')) { card.set('isActive', false); }
    let builderCard = this.store.createRecord('builder_card', {
      card: card,
      count: 1,
      deck: this
    });
    this.get('cards').pushObject(builderCard);
    return builderCard;
  },

  removeCard(builderCard){
    builderCard.set('card.isActive', true);
    builderCard.decrementProperty('count');
    if (Ember.isEqual(builderCard.get('count'), 0)) {
      builderCard.destroyRecord();
    }
  }

});
