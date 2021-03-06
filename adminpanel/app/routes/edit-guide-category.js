import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.findRecord('guide_category', params.id);
  },
  setupController(controller, model){
    this._super(controller, model);
    controller.set('name', model.get('name'));
  }
});

