import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['mana-curve', 'well'],
  mana: [
    Ember.Object.create({cost: 0, name: 0, count: 0 }),
    Ember.Object.create({cost: 1, name: 1, count: 0 }),
    Ember.Object.create({cost: 2, name: 2, count: 0 }),
    Ember.Object.create({cost: 3, name: 3, count: 0 }),
    Ember.Object.create({cost: 4, name: 4, count: 0 }),
    Ember.Object.create({cost: 5, name: 5, count: 0 }),
    Ember.Object.create({cost: 6, name: 6, count: 0 }),
    Ember.Object.create({cost: 7, name: '7+', count: 0 })
  ],

  unitSize: Ember.computed('deck.totalCards', function(){
    var [_this, max] = [this, 0];
    this.get('mana').forEach(function(manaItem){
      let sum = 0;
      let costCards = _this.get('deck.cards').filter(function (bCard) {
        let cost = bCard.get('card.cost');
        let itemCost = manaItem.get('cost');
        if (cost == 7){
          return itemCost >= cost;
        } else {
          return itemCost == cost;
        }
      });
      costCards.forEach(function(item){ sum += item.get('count') });
      if (sum > max){ max = sum }
    });
    if (max <= 8){
      return 12.5;
    } else {
      return 100/max;
    }
  })
});
