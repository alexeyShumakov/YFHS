import DS from 'ember-data';

export default DS.Model.extend({
  card: DS.belongsTo('card'),
  deck: DS.belongsTo('deck'),
  count: DS.attr('number'),

  disableCard(){
    if (this.get('count') > 1 || this.get('card.isLegendary')){
      this.set('card.isActive', false);
    }
  },

  enableCard(){
    this.set('card.isActive', true);
  },

  showCount: Ember.computed('count', function(){
    if (this.get('count') >= 2){
      return this.get('count');
    } else {
      return null;
    }
  })
});
