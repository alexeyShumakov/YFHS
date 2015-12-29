import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(transition){
    return this.set('user_id', transition.params.user.id);
  },

  model(){
    let params = {
      user_id: this.get('user_id'),
      include: 'player-class,user,deck-type'
    };
    return this.store.query('deck', params);
  },

  setupController(controller, model){
    this._super(controller, model);
    let params = {
      user_id: this.get('user_id'),
      include: 'player-class,user,deck-type'
    };
    controller.set('params', params);
  }
});
