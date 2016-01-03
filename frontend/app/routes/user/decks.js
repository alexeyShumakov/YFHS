import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let params = {
      user_id: this.modelFor('user').get('id'),
      include: 'player-class,user,deck-type'
    };
    return this.store.query('deck', params);
  },

  setupController(controller, model){
    this._super(controller, model);
    let params = {
      user_id: this.modelFor('user').get('id'),
      include: 'player-class,user,deck-type'
    };
    controller.set('params', params);
  }
});
