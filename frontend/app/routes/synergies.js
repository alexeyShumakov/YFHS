import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    return this.store.findAll('player_class');
  },

  deactivate(){
    this.controller.clearProp();
  }
});
