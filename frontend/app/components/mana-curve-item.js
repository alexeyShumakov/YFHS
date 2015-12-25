import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['curve-item'],
  itemHeight: Ember.computed('totalCount', function(){
    var height = this.get('totalCount') * this.get('unitSize');
    return (`height: ${height}%`).htmlSafe();
  }),

  totalCount: Ember.computed.sum('totalCountMap'),
  totalCountMap: Ember.computed.mapBy('costCards', 'count'),
  obs: Ember.observer('deck.totalCards', function(){
    this.set('manaItem.count', this.get('totalCount'));
  }),

  costCards: Ember.computed('deck.totalCards', function(){
    var cost = this.get('manaItem.cost');
    return this.get('deck.cards').filter(function(item){
      var itemCost = item.get('card.cost');
      if (cost == 7){
        return itemCost >= cost;
      } else {
        return itemCost == cost;
      }
    });
})
});
