import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(transition){
    return this.set('user_id', transition.params.user.id);
  },

  model(){
    let params = {
      user_id: this.get('user_id'),
      include: 'user'
    };
    return this.store.query('comment', params);
  },

  setupController(controller, model){
    this._super(controller, model);
    let params = {
      user_id: this.get('user_id'),
      include: 'user'
    };
    controller.set('params', params);
  }
});
