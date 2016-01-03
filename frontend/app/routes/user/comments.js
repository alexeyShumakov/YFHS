import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let params = {
      user_id: this.modelFor('user').get('id'),
      include: 'user'
    };
    return this.store.query('comment', params);
  },

  setupController(controller, model){
    this._super(controller, model);
    let params = {
      user_id: this.modelFor('user').get('id'),
      include: 'user'
    };
    controller.set('params', params);
  }
});
