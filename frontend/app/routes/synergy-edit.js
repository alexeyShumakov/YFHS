import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    let include = 'player-class,synergy-cards,synergy-cards.card,user';
    return this.store.query('synergy', { id: params.id, include:include }).then(
      function(synergies){
        return synergies.get('firstObject');
      })
  },

  afterModel(model){
    if (!this.get('currentUser').canEdit(model)){
      this.transitionTo('application');
    }
  }
});
