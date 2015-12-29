import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    params.include = 'player-class,user,synergy-cards,synergy-cards.card';
    return this.store.query('synergy', params);
  }
});
