import DS from 'ember-data';

export default DS.Model.extend({
  card: DS.belongsTo('card'),
  synergy: DS.belongsTo('synergy'),
  disableCard(){
    this.set('card.isActive', false);
  },
  enableCard(){
    this.set('card.isActive', true);
  }
});
