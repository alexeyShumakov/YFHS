import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let params = {
      user_id: this.modelFor('user').get('id'),
      include: 'player-class,user,synergy-cards,synergy-cards.card'
    };
    return this.store.query('synergy', params);
  },

  setupController(controller, model){
    this._super(controller, model);
    let params = {
      user_id: this.modelFor('user').get('id'),
      include: 'player-class,user,synergy-cards,synergy-cards.card'
    };
    controller.set('params', params);
  }
});
