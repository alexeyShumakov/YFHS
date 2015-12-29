import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(transition){
    return this.set('user_id', transition.params.user.id);
  },

  model(){
    let params = {
      user_id: this.get('user_id'),
      include: 'player-class,user,synergy-cards,synergy-cards.card'
    };
    return this.store.query('synergy', params);
  },

  setupController(controller, model){
    this._super(controller, model);
    let params = {
      user_id: this.get('user_id'),
      include: 'player-class,user,synergy-cards,synergy-cards.card'
    };
    controller.set('params', params);
  }
});
